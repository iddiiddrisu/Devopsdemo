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