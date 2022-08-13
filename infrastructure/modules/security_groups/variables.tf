variable "secgroup_network_vpc_id" {
  type = string
}
variable "secgroup_jumpbox_ec2_group_name" {
  type = string
}
variable "secgroup_jumpbox_ec2_ingress_cidr_list" {
  type = list(string)
}
variable "secgroup_jumpbox_ec2_ingress_rules_list" {
  type = list(string)
}
variable "secgroup_jumpbox_ec2_allow_egress_cidrs_list" {
  type = list(string)
}
variable "secgroup_public_elb_group_name" {
  type = string
}
variable "secgroup_public_elb_group_rule_list" {
  type = list(string)
}
variable "secgroup_public_elb_allow_ingress_waf_cidrs_list" {
  type = list(string)
}
variable "secgroup_public_elb_allow_egress_cidrs_list" {
  type = list(string)
}
variable "secgroup_app_ecs_group_name" {}
variable "secgroup_app_ecs_from_port" {}
variable "secgroup_app_ecs_to_port" {}
variable "secgroup_app_ecs_allow_egress_cidrs_list" {
  type = list(string)
}
variable "secgroup_single_multiregion_rds_group_name" {}
variable "secgroup_single_multiregion_rds_from_port" {}
variable "secgroup_single_multiregion_rds_to_port" {}
variable "secgroup_single_multiregion_rds_allowed_ingress_cidr" {}
variable "secgroup_mysql_allow_egress_cidrs_list" {}

variable "secgroup_scheduler_ec2_group_name" {}
variable "secgroup_scheduler_ec2_ingress_cidr_list" {}
variable "secgroup_scheduler_ec2_ingress_rules_list" {}
variable "secgroup_scheduler_ec2_allow_egress_cidrs_list" {}
variable "secgroup_product_name" {}
variable "secgroup_caller_id" {}
variable "secgroup_environment"{}

