######################################################################
################# Security Groups Implementation #####################
module "securitygroups" {
  source                                               = "../modules/security_groups"
  secgroup_app_ecs_group_name                          = "${local.global_prefix}-${var.var_secgroup_app_ecs_group_name}"
  secgroup_app_ecs_to_port                             = var.var_secgroup_app_ecs_to_port
  secgroup_app_ecs_from_port                           = var.var_secgroup_app_ecs_from_port
  secgroup_jumpbox_ec2_ingress_cidr_list               = var.var_secgroup_jumpbox_ec2_ingress_cidr_list
  secgroup_jumpbox_ec2_group_name                      = "${local.global_prefix}-${var.var_secgroup_jumpbox_ec2_group_name}"
  secgroup_jumpbox_ec2_ingress_rules_list              = var.var_secgroup_jumpbox_ec2_ingress_rules_list
  secgroup_network_vpc_id                              = module.vpc.output_vpc_vpc_id
  secgroup_public_elb_group_name                       = "${local.global_prefix}-${var.var_secgroup_public_elb_group_name}"
  secgroup_public_elb_group_rule_list                  = var.var_secgroup_public_elb_group_rule_list
  secgroup_single_multiregion_rds_group_name           = "${local.global_prefix}-${var.var_secgroup_single_multiregion_rds_group_name}"
  secgroup_public_elb_allow_ingress_waf_cidrs_list     = var.var_secgroup_public_elb_allow_ingress_waf_cidrs_list
  secgroup_single_multiregion_rds_from_port            = var.var_global_mysql_port
  secgroup_single_multiregion_rds_to_port              = var.var_global_mysql_port
  secgroup_app_ecs_allow_egress_cidrs_list             = var.var_secgroup_app_ecs_allow_egress_cidrs_list
  secgroup_jumpbox_ec2_allow_egress_cidrs_list         = var.var_secgroup_jumpbox_ec2_allow_egress_cidrs_list
  secgroup_mysql_allow_egress_cidrs_list               = var.var_secgroup_mysql_allow_egress_cidrs_list
  secgroup_public_elb_allow_egress_cidrs_list          = var.var_secgroup_public_elb_allow_egress_cidrs_list
  secgroup_single_multiregion_rds_allowed_ingress_cidr = var.var_secgroup_single_multiregion_rds_allowed_ingress_cidr

  secgroup_caller_id                             = data.aws_caller_identity.current.arn
  secgroup_product_name                          = var.var_global_product
  secgroup_environment                           = var.var_global_aws_environment
}
