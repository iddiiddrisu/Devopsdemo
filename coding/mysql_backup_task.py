#!/usr/bin/python3
import os, sys, configparser, subprocess, datetime, time
import mysql.connector as mysc
import boto3
from botocore.exceptions import NoCredentialsError
import pymsteams
import logging
import tarfile, gzip, shutil


class SmartGridDbBackup:

    def __init__(self, *args):
        try:
            self.args = args
            ini_file_path = args[0][0]
            self.config = configparser.RawConfigParser()
            # self.config.read(
            #     '/root/scripts/backupscripts/mysql/details.INI')  # Add the full path to the details.INI file
            self.config.read(
                ini_file_path)
            host = self.config.get('db', 'host')
            port = self.config.get('db', 'port')
            user = self.config.get('db', 'user')
            passwd = self.config.get('db', 'passwd')
            database = self.config.get('db', 'database')
            db_dump_path = self.config.get('db', 'db_dump_path')

            # Connection to the database
            conn = mysc.connect(host=host, port=port, user=user, passwd=passwd, database=database)
            print("Connection to database successfull........")

        except Exception as e:
            print(e)
            sys.exit()

        # try:
        if not os.path.exists(db_dump_path):
            os.makedirs(db_dump_path)
        now = time.strftime('%Y_%m_%d_%H_%M_%S')
        # Creating a dumb of the database before creating the tar
        myfile = database + '_' + now + '.sql'
        myfile1 = os.path.join(db_dump_path, myfile)
        subprocess.check_call(
            'mysqldump --user={0} --password={1} --host={2} --protocol=tcp --port={3} --default-character-set=utf8 "{4}" > {5}'.format(
                user, passwd, host, port, database, myfile1), shell=True)

        # Creating the tar of the dump file
        tar_name = database + '_' + now + '.sql.gzip'
        with open(myfile1, 'rb') as f_in:
            with gzip.open(tar_name, 'wb') as f_out:
                shutil.copyfileobj(f_in, f_out)

        self.upload_to_s3(tar_name, tar_name)
        print("backup completed succesfully...")


    # Function to upload to the s3 bucket
    def upload_to_s3(self, filename, myfile):
        access_key = self.config.get('backup', 'access_key')
        secret_key = self.config.get('backup', 'secret_key')
        bucket = self.config.get('backup', 'bucket')
        backup_path = self.config.get('backup', 'backup_path')

        s3 = boto3.resource('s3', aws_access_key_id=access_key,
                            aws_secret_access_key=secret_key)

        try:
            # s3.upload_file(filename, bucket, filename)
            s3.meta.client.upload_file(filename, bucket, backup_path + "/" + filename)
            print("Upload successful........")
            title = "SUCCESSFUL DAILY BACKUP - "
            msg = """Your  MySQL Database backup was successful.\n
                """ + myfile + """  has been backed up and uploaded to the 
                """ + bucket
            self.send_notfication_to_teams(title, msg)
            self.success_logger(msg)
            return True
        except NoCredentialsError:
            error_alert = """Your daily backup wasn't successful because 
                your AWS bucket credentials are invalid
            """
            etitle = "DAILY BACKUP FAILURE - "
            self.send_notfication_to_teams(etitle, error_alert)
            self.error_logger(error_alert)
            print("Invalid credentials were provided...")
        except Exception as e:
            etitle1 = "DAILY BACKUP FAILURE - "
            err_alert = "Your daily backup wasn't successful because \n \n"
            self.send_notfication_to_teams(etitle1, err_alert)
            self.error_logger(err_alert)
            print(e)

    # Sending notification to Microsoft Teams
    def send_notfication_to_teams(self, title, message):
        endpoint = self.config.get('teamsAlert', 'run_OpsAlert_endpoint')
        myMessage = pymsteams.connectorcard(endpoint)
        myMessage.text(message)
        myMessage.send()

    # logging functions
    def success_logger(self, msgg):
        logfile = self.config.get('logger', 'logfile')
        logging.basicConfig(filename=logfile, format='%(asctime)s  %(message)s', filemode='a')
        logger = logging.getLogger()
        logger.setLevel(logging.DEBUG)
        logger.debug(msgg)

    def error_logger(self, err_msgg):
        logfile = self.config.get('logger', 'logfile')
        logging.basicConfig(filename=logfile, format='%(asctime)s  %(message)s', filemode='a')
        logger = logging.getLogger()
        logger.setLevel(logging.DEBUG)
        logger.error(err_msgg)


if __name__ == '__main__':
    SmartGridDbBackup(sys.argv[1:])
