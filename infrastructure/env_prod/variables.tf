//Global Vars
variable "var_global_aws_profile" {}
variable "var_global_aws_region" {}
variable "var_global_aws_environment" {}
variable "var_global_product" {}

#IAM Vars
variable "var_iam_ec2_ec2_session_manager_ssm_policy_name" {}
variable "var_iam_ec2_profile_name" {}
variable "var_iam_ec2_role_name" {}
variable "var_iam_ec2_s3_bucket_arn_list" {
  type = list(string)
}
variable "var_iam_ec2_s3_policy_name" {}
variable "var_iam_ecs_task_bucket_arn_list" {
  type = list(string)
}
variable "var_iam_ecs_task_loggroup_resources_list" {
  type = list(string)
}
variable "var_iam_ecs_task_policy_name" {}
variable "var_iam_ecs_task_role_name" {}
variable "var_iam_ec2_secret_manager_readwrite_resource_name" {}


#Network Vars
variable "vpc_cidr" {
  type = string
}
variable "vpc_create_database_subnet" {
  type = string
}
variable "vpc_database_subnet_group_name" {
  type = string
}
variable "vpc_enable_hostname" {
  type = string
}
variable "vpc_enable_nat_gateway" {
  type = bool
}
variable "vpc_enable_single_nat_gateway" {
  type = bool
}
variable "vpc_global_environment" {
  type = string
}
variable "vpc_name" {
  type = string
}
variable "vpc_private_database_subnets_cidrs" {
  type = list(string)
}
variable "vpc_private_subnets_cidrs" {
  type = list(string)
}
variable "vpc_public_subnets_cidrs" {
  type = list(string)
}


# Security Group Vars
variable "var_secgroup_app_ecs_allow_egress_cidrs_list" {}
variable "var_secgroup_jumpbox_ec2_allow_egress_cidrs_list" {}
variable "var_secgroup_mysql_allow_egress_cidrs_list" {}
variable "var_secgroup_public_elb_allow_egress_cidrs_list" {}
variable "var_secgroup_single_multiregion_rds_allowed_ingress_cidr" {}
variable "var_secgroup_app_ecs_group_name" {}
variable "var_secgroup_app_ecs_to_port" {}
variable "var_secgroup_app_ecs_from_port" {}
variable "var_secgroup_jumpbox_ec2_ingress_cidr_list" {}
variable "var_secgroup_jumpbox_ec2_group_name" {}
variable "var_secgroup_jumpbox_ec2_ingress_rules_list" {}
variable "var_secgroup_public_elb_group_name" {}
variable "var_secgroup_public_elb_group_rule_list" {}
variable "var_secgroup_single_multiregion_rds_group_name" {}
variable "var_secgroup_public_elb_allow_ingress_waf_cidrs_list" {}
variable "var_rds_aurora_multiregion_parameter_max_con" {}
variable "var_global_mysql_port" {}


# Load balancer Vars
variable "var_load_balancer_default_tg_name" {}
variable "var_load_balancer_name" {}

#RDS Vars
variable "var_rds_aurora_mr_apply_immediately" {
  type = bool
}
variable "var_rds_aurora_mr_cloudwatch_logs_exports" {
  type = list(string)
}
variable "var_rds_aurora_mr_cluster_gr_family" {}
variable "var_rds_aurora_mr_cluster_param_gr_name" {}
variable "var_rds_aurora_mr_create_db_subnet_group" {}
variable "var_rds_aurora_mr_create_security_group" {}
variable "var_rds_aurora_mr_database_name" {}
variable "var_rds_aurora_mr_engine" {}
variable "var_rds_aurora_mr_engine_version" {}
variable "var_rds_aurora_mr_first_instance_class" {}
variable "var_rds_aurora_mr_first_instance_identifier" {}
variable "var_rds_aurora_mr_first_publicly_assessible" {
  type = bool
}
variable "var_rds_aurora_mr_iam_authentication_enable" {
  type = bool
}
variable "var_rds_aurora_mr_identifier" {}
variable "var_rds_aurora_mr_master_password" {}
variable "var_rds_aurora_mr_master_username" {}
variable "var_rds_aurora_mr_param_gr_family" {}
variable "var_rds_aurora_mr_param_gr_name" {}
variable "var_rds_aurora_mr_second_instance_class" {}
variable "var_rds_aurora_mr_second_instance_identifier" {}
variable "var_rds_aurora_mr_second_publicly_assessible" {
  type = bool
}
variable "var_rds_aurora_mr_skip_final_snapshot" {
  type = bool
}

#EC2 Vars
variable "var_global_ec2instance_aws_ami_owner_list" {}
variable "var_global_ec2instance_filter_full_ref_list" {}
variable "var_global_ec2instance_filter_virtualiazation_type_list" {}