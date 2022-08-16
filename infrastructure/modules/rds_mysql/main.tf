

resource "aws_db_parameter_group" "mysql_db_mysql_57_param_group" {
  name        = var.rds_mysql_db_param_gr_name
  family      = var.rds_mysql_db_param_gr_family
  description = "rds mysql paramerter group"

  parameter {
    apply_method = "immediate"
    name  = "max_connections"
    value = var.rds_mysql_db_parameter_max_con
  }

  tags = {
    Terraform = true
    Name = var.rds_mysql_db_param_gr_name
    Product = var.rds_mysql_db_product_name
    ENV = var.rds_mysql_db_environment
  }
}

module "rds_mysql" {
  source  = "terraform-aws-modules/rds/aws"

  identifier = var.rds_mysql_db_identifier
  engine = var.rds_mysql_db_engine
  engine_version = var.rds_mysql_db_engine_version
  family = var.rds_mysql_db_family
  instance_class = var.rds_mysql_db_instance_class
  allocated_storage = var.rds_mysql_db_allocated_storage
  major_engine_version = var.rds_mysql_db_major_engine_version


  db_name = var.rds_mysql_db_name
  username = var.rds_mysql_db_username
  port = var.rds_mysql_db_port
  iam_database_authentication_enabled = var.rds_mysql_db_allow_iam_auth
  vpc_security_group_ids = var.rds_mysql_db_security_groups_ids_list

  create_db_subnet_group = var.rds_mysql_db_create_subnet_group
  db_subnet_group_name = var.rds_mysql_db_subnet_group_name
  multi_az = var.rds_mysql_db_is_multi_az

  create_db_parameter_group = false
  parameter_group_name = aws_db_parameter_group.mysql_db_mysql_57_param_group.name

  backup_retention_period = var.rds_mysql_db_backup_retention_period
  skip_final_snapshot     = var.rds_mysql_db_skip_final_snaphot
  deletion_protection     = var.rds_mysql_db_deletion_protection

  performance_insights_enabled          = var.rds_mysql_db_performance_insight_enabled
  performance_insights_retention_period = var.rds_mysql_db_performance_insight_retention
  create_monitoring_role                = var.rds_mysql_db_create_monitoring_role
  monitoring_interval                   = var.rds_mysql_db_monitoring_interval

  tags = {
    Terraform = true
    Name = var.rds_mysql_db_identifier
    Product = var.rds_mysql_db_product_name
    ENV = var.rds_mysql_db_environment
  }
}