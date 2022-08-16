######################################################################
###################### Network Implementation ########################
module "vpc" {
  source                                 = "../modules/network"
  network_availability_zones             = data.aws_availability_zones.azs.names
  network_cidr                           = var.vpc_cidr
  network_create_database_subnet         = var.vpc_create_database_subnet
  network_database_subnet_group_name     = "${local.global_prefix}-${var.vpc_database_subnet_group_name}"
  network_enable_hostname                = var.vpc_enable_hostname
  network_enable_nat_gateway             = var.vpc_enable_nat_gateway
  network_enable_single_nat_gateway      = var.vpc_enable_single_nat_gateway
  network_global_environment             = var.var_global_aws_environment
  network_name                           = "${local.global_prefix}-${var.vpc_name}"
  network_private_database_subnets_cidrs = var.vpc_private_database_subnets_cidrs
  network_private_subnets_cidrs          = var.vpc_private_subnets_cidrs
  network_public_subnets_cidrs           = var.vpc_public_subnets_cidrs
  network_caller_id                      = data.aws_caller_identity.current.arn
  network_product_name                   = var.var_global_product
}