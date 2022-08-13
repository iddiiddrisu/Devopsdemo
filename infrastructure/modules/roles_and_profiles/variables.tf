variable "iam_ec2_role_name" {}
variable "iam_ec2_s3_bucket_arn_list" {
  type = list(string)
}
variable "iam_ec2_s3_policy_name" {}
variable "iam_ec2_ec2_session_manager_ssm_policy_name" {}
variable "iam_ec2_profile_name" {}
variable "iam_ecs_task_role_name" {}
variable "iam_ecs_task_loggroup_resources_list" {
  type = list(string)
}
variable "iam_ecs_task_bucket_arn_list" {
  type = list(string)
}
variable "iam_ecs_task_policy_name" {}
variable "iam_product_name" {}
variable "iam_environment" {}

variable "iam_ec2_secrets_manager_readwrite_resources" {
  type = list(string)
}

variable "iam_ec2_secret_manager_readwrite_resource_name" {}