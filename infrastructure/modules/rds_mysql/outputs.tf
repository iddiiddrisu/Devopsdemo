output "output_rds_mysql_endpoint" {
  value = module.rds_mysql.db_instance_endpoint
}

output "output_rds_mysql_version" {
  value = module.rds_mysql.db_instance_engine_version_actual
}

output "output_rds_mysql_engine" {
  value = module.rds_mysql.db_instance_engine
}

output "output_rds_mysql_password" {
  value = module.rds_mysql.db_instance_password
}

output "output_rds_mysql_port" {
  value = module.rds_mysql.db_instance_password
}

output "output_rds_mysql_arn" {
  value = module.rds_mysql.db_instance_arn
}