# phlosysdemo
## Introduction
This project contains code for Phlosys Test.

## Folder Structure
./ <br>
├─ automation <br>
│ └─ files <br>
│ └─ inventory <br>
│ └─ playbook_vars <br>
│ └─ playbook files <br>
│ └─ README.md <br>
├─ coding <br>
│ └─ mysql_backup_task.py <br>
│ └─ Pipfile <br>
│ └─ details.ini <br>
├─ images <br>
│ └─ project diagrams <br>
├─ infrastructure <br>
│ └─ env_prod <br>
│ └─ modules <br>
│ └─ README.md <br>
└─ README.md

## Git Code of Conduct
This project uses git-flow principles in managing this repository.
Branch out of develop to create a new branch.

## How to run infrastructure code
1. cd env_prod
2. run `terraform init`
3. run `terraform plan`
4. run  `terraform apply`

## How to run Automation code
ansible-playbook -i inventory -u ubuntu --private-key prod_phlosys.pem all_playbook.yml --vault-password-file vault.password -e "global_var_environment=prod"  --skip-tags facts

## How to run Coding code
1. create details.ini file
2. run 'python mysql_backup_task.py /path/to/details.ini'
