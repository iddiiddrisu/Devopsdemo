######################################################################
###################### IAM Implementation ###################################
module "iam" {
  source                                      = "../modules/roles_and_profiles"
  iam_ec2_ec2_session_manager_ssm_policy_name = "${local.global_prefix}-${var.var_iam_ec2_ec2_session_manager_ssm_policy_name}"
  iam_ec2_profile_name                        = "${local.global_prefix}-${var.var_iam_ec2_profile_name}"
  iam_ec2_role_name                           = "${local.global_prefix}-${var.var_iam_ec2_role_name}"
  iam_ec2_s3_bucket_arn_list                  = var.var_iam_ec2_s3_bucket_arn_list
  iam_ec2_s3_policy_name                      = "${local.global_prefix}-${var.var_iam_ec2_s3_policy_name}"
  iam_ecs_task_bucket_arn_list                = var.var_iam_ecs_task_bucket_arn_list
  iam_ecs_task_loggroup_resources_list        = var.var_iam_ecs_task_loggroup_resources_list
  iam_ecs_task_policy_name                    = "${local.global_prefix}-${var.var_iam_ecs_task_policy_name}"
  iam_ecs_task_role_name                      = "${local.global_prefix}-${var.var_iam_ecs_task_role_name}"
  iam_environment = var.var_global_aws_environment
  iam_product_name = var.var_global_product
  iam_ec2_secret_manager_readwrite_resource_name = var.var_iam_ec2_secret_manager_readwrite_resource_name
  iam_ec2_secrets_manager_readwrite_resources = ["arn:aws:secretsmanager:${var.var_global_aws_region}:${data.aws_caller_identity.current.account_id}:secret:${var.var_global_aws_environment}-${var.var_global_product}-vault*"]
}