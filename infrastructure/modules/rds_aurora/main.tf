######################################################################
###################### RDS Section ###################################

#Creating database parameter group and setting up max connections
resource "aws_db_parameter_group" "aurora_multiregion_mysql_57_param_group" {
  name        = var.rds_aurora_multiregion_param_gr_name
  family      = var.rds_aurora_multiregion_param_gr_family
  description = "multiregion aurora rds paramerter group"

  parameter {
    apply_method = "immediate"
    name  = "max_connections"
    value = var.rds_aurora_multiregion_parameter_max_con
  }

  tags = {
    Terraform = true
    Name = var.rds_aurora_multiregion_param_gr_name
    Product = var.rds_aurora_multiregion_product_name
    ENV = var.rds_aurora_multiregion_environment
  }
}

#Creating RDS Cluster parameter group
resource "aws_rds_cluster_parameter_group" "aurora_multiregion_cluster_mysql_57_param_group" {
  name        = var.rds_aurora_multiregion_cluster_param_gr_name
  family      = var.rds_aurora_multiregion_cluster_gr_family
  description = "multiregion aurora rds cluster param group"

  tags = {
    Terraform = true
    Name = var.rds_aurora_multiregion_cluster_param_gr_name
    Product = var.rds_aurora_multiregion_product_name
    ENV = var.rds_aurora_multiregion_environment
  }
}

# Creates RDS Instance
module "rds_aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  name = var.rds_aurora_multiregion_identifier
  engine = var.rds_aurora_multiregion_engine
  engine_version = var.rds_aurora_multiregion_engine_version
  instances = {
    1 = {
      identifier   = var.rds_aurora_multiregion_first_instance_identifier
      instance_class = var.rds_aurora_multiregion_first_instance_class
      publicly_accessible = var.rds_aurora_multiregion_first_publicly_assessible
    }
    2 = {
      identifier   = var.rds_aurora_multiregion_second_instance_identifier
      instance_class = var.rds_aurora_multiregion_second_instance_class
      publicly_accessible = var.rds_aurora_multiregion_second_publicly_assessible
    }
  }
  vpc_id = var.rds_aurora_multiregion_vpc_id
  db_subnet_group_name = var.rds_aurora_multiregion_subnet_group_name
  create_db_subnet_group = var.rds_aurora_multiregion_create_db_subnet_group
  create_security_group = var.rds_aurora_multiregion_create_security_group
  iam_database_authentication_enabled = var.rds_aurora_multiregion_iam_authentication_enable
  master_password = var.rds_aurora_multiregion_master_password
  master_username = var.rds_aurora_multiregion_master_username
  database_name   = var.rds_aurora_multiregion_database_name
  apply_immediately = var.rds_aurora_multiregion_apply_immediately
  skip_final_snapshot = var.rds_aurora_multiregion_skip_final_snapshot
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.aurora_multiregion_cluster_mysql_57_param_group.name
  db_parameter_group_name = aws_db_parameter_group.aurora_multiregion_mysql_57_param_group.name
  enabled_cloudwatch_logs_exports = var.rds_aurora_multiregion_cloudwatch_logs_exports
  vpc_security_group_ids = var.rds_aurora_multiregion_vpc_security_group_ids_list
  port                   = var.rds_aurora_multiregion_db_port
  tags = {
    Terraform = true
    Name = var.rds_aurora_multiregion_identifier
    Product = var.rds_aurora_multiregion_product_name
    ENV = var.rds_aurora_multiregion_environment
  }
}