var_global_mysql_port      = "4417"
var_global_aws_profile     = "default"
var_global_aws_region      = "eu-west-1"
var_global_product         = "phlosys"
var_global_aws_environment = "prod"

vpc_cidr                           = "10.20.0.0/16"
vpc_create_database_subnet         = true
vpc_database_subnet_group_name     = "subnet-group"
vpc_enable_hostname                = true
vpc_enable_nat_gateway             = true
vpc_enable_single_nat_gateway      = true
vpc_global_environment             = "prod"
vpc_name                           = "vpc"
#three subnets each for HA 
vpc_private_database_subnets_cidrs = ["10.20.20.0/24", "10.20.21.0/24", "10.20.22.0/24"]
vpc_private_subnets_cidrs          = ["10.20.10.0/24", "10.20.11.0/24", "10.20.12.0/24"]
vpc_public_subnets_cidrs           = ["10.20.0.0/24", "10.20.1.0/24", "10.20.2.0/24"]

var_secgroup_app_ecs_group_name                      = "app-ecs-secgroup"
var_secgroup_app_ecs_to_port                         = "8090"
var_secgroup_app_ecs_from_port                       = "80"
var_secgroup_jumpbox_ec2_ingress_cidr_list           = ["154.160.30.168/32"]
var_secgroup_jumpbox_ec2_group_name                  = "jumpbox-secgroup"
var_secgroup_jumpbox_ec2_ingress_rules_list          = ["ssh-tcp"]
var_secgroup_public_elb_group_name                   = "public-elb-secgroup"
var_secgroup_public_elb_group_rule_list              = ["http-80-tcp"]
var_secgroup_single_multiregion_rds_group_name       = "single-multireg-rds-secgroup"
var_secgroup_public_elb_allow_ingress_waf_cidrs_list = ["0.0.0.0/0"]

var_secgroup_app_ecs_allow_egress_cidrs_list             = ["0.0.0.0/0"]
var_secgroup_jumpbox_ec2_allow_egress_cidrs_list         = ["0.0.0.0/0"]
var_secgroup_mysql_allow_egress_cidrs_list               = ["0.0.0.0/0"]
var_secgroup_public_elb_allow_egress_cidrs_list          = ["0.0.0.0/0"]
var_secgroup_single_multiregion_rds_allowed_ingress_cidr = "10.25.0.0/16"

var_rds_aurora_mr_apply_immediately       = true
var_rds_aurora_mr_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
var_rds_aurora_mr_cluster_gr_family       = "aurora-mysql5.7"
var_rds_aurora_mr_cluster_param_gr_name   = "multiregion-cluster-param-group"
var_rds_aurora_mr_create_db_subnet_group  = false
var_rds_aurora_mr_create_security_group   = false
var_rds_aurora_mr_engine                    = "aurora-mysql"
var_rds_aurora_mr_engine_version            = "5.7.mysql_aurora.2.10.2"
var_rds_aurora_mr_first_instance_class      = "db.t3.micro"
var_rds_aurora_mr_first_instance_identifier = "aurora-1"
var_rds_aurora_mr_first_publicly_assessible = false
var_rds_aurora_mr_iam_authentication_enable = true
var_rds_aurora_mr_identifier                = "aurora"
var_rds_aurora_mr_param_gr_family            = "aurora-mysql5.7"
var_rds_aurora_mr_param_gr_name              = "multiregion-param-group"
var_rds_aurora_mr_skip_final_snapshot        = true

var_global_ec2instance_aws_ami_owner_list               = ["099720109477"]
var_global_ec2instance_filter_full_ref_list             = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
var_global_ec2instance_filter_virtualiazation_type_list = ["hvm"]

var_iam_ec2_ec2_session_manager_ssm_policy_name = "custom-ec2-ssm"
var_iam_ec2_profile_name                        = "ec2-profile"
var_iam_ec2_role_name                           = "ec2-role"
var_iam_ec2_s3_bucket_arn_list = [
  "arn:aws:s3:::assets.phlosys.prod",
  "arn:aws:s3:::assets.phlosys.prod/*",
  "arn:aws:s3:::binaries.phlosys.prod*",
  "arn:aws:s3:::binaries.phlosys.prod/*"
]
var_iam_ec2_s3_policy_name = "custom-ec2-s3"
var_iam_ecs_task_bucket_arn_list = [
  "arn:aws:s3:::assets.phlosys.prod",
  "arn:aws:s3:::assets.phlosys.prod/*"
]
var_iam_ecs_task_loggroup_resources_list = ["*"]
var_iam_ecs_task_policy_name             = "custom-ecs-exec"
var_iam_ecs_task_role_name               = "ecs-task-role"



var_load_balancer_default_tg_name = "defaultTG"
var_load_balancer_name = "endpoint"

var_rds_aurora_multiregion_parameter_max_con = 500

var_iam_ec2_secret_manager_readwrite_resource_name = "custom-secretsmanager"
