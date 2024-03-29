######################################################################
###################### RDS Implementation ###################################
module "rds_mysql" {
  source = "../modules/rds_mysql"
  rds_mysql_db_allocated_storage = "20"
  rds_mysql_db_allow_iam_auth = true
  rds_mysql_db_backup_retention_period = "30"
  rds_mysql_db_create_monitoring_role = "false"
  rds_mysql_db_create_subnet_group = var.var_rds_mysql_db_create_subnet_group
  rds_mysql_db_deletion_protection = false
  rds_mysql_db_engine = var.var_rds_mysql_db_engine
  rds_mysql_db_engine_version = var.var_rds_mysql_db_engine_version
  rds_mysql_db_environment = var.var_global_aws_environment
  rds_mysql_db_family = var.var_rds_mysql_db_family
  rds_mysql_db_identifier = "${local.global_prefix}-db"
  rds_mysql_db_instance_class = var.var_rds_mysql_db_instance_class
  rds_mysql_db_is_multi_az = false
  rds_mysql_db_major_engine_version = var.var_rds_mysql_db_major_engine_version
  rds_mysql_db_monitoring_interval = "0"
  rds_mysql_db_name = var.var_rds_db_name
  rds_mysql_db_param_gr_family = var.var_rds_mysql_db_param_gr_family
  rds_mysql_db_param_gr_name = "${local.global_prefix}-mysql57"
  rds_mysql_db_parameter_max_con = var.var_rds_mysql_db_parameter_max_con
  rds_mysql_db_performance_insight_enabled = false
  rds_mysql_db_performance_insight_retention = "0"
  rds_mysql_db_port = var.var_global_mysql_port
  rds_mysql_db_product_name = var.var_global_product
  rds_mysql_db_security_groups_ids_list = [module.securitygroups.output_secgroup_mysql_group_id]
  rds_mysql_db_skip_final_snaphot = true
  rds_mysql_db_subnet_group_name = module.vpc.output_vpc_database_subnet_group_name
  rds_mysql_db_username = var.var_rds_mysql_db_username
}