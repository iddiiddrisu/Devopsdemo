output "output_network_vpc_id" {
  value = module.vpc.output_vpc_vpc_id
}

output "output_load_balancer_cname" {
  value = module.alb.output_load_balancer_dns_name
}

output "output_iam_profile_name" {
  value = module.iam.output_instance_profile_name
}

output "output_rds_mysql_db_endpoint" {
  value = module.rds_mysql.output_rds_mysql_endpoint
}
output "output_rds_mysql_db_password" {
  value = module.rds_mysql.output_rds_mysql_password
  sensitive = true
}

output "output_rds_mysql_db_port" {
  value = module.rds_mysql.output_rds_mysql_port
  sensitive = true
}