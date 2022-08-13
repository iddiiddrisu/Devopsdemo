######################################################################
###################### Security Group Section ########################

# Creating Security Group for scheduler instance
module "scheduler_ec2_security_group" {
  source                                   = "terraform-aws-modules/security-group/aws"
  vpc_id                                   = var.secgroup_network_vpc_id
  name                                     = var.secgroup_scheduler_ec2_group_name
  description                              = "Security Group EC2"
  ingress_cidr_blocks     = var.secgroup_scheduler_ec2_ingress_cidr_list
  ingress_rules            = var.secgroup_scheduler_ec2_ingress_rules_list
  egress_cidr_blocks      = var.secgroup_scheduler_ec2_allow_egress_cidrs_list
  egress_rules      = ["all-all"]
  tags = {
    Terraform = true
    Name = var.secgroup_scheduler_ec2_group_name
    Product = var.secgroup_product_name
    ENV = var.secgroup_environment
  }
}

# Creating Security Group for jumpbox instance
module "jumpbox_ec2_security_group" {
  source                                   = "terraform-aws-modules/security-group/aws"
  vpc_id                                   = var.secgroup_network_vpc_id
  name                                     = var.secgroup_jumpbox_ec2_group_name
  description                              = "Security Group EC2"
  ingress_cidr_blocks     = var.secgroup_jumpbox_ec2_ingress_cidr_list
  ingress_rules            = var.secgroup_jumpbox_ec2_ingress_rules_list
  egress_cidr_blocks      = var.secgroup_jumpbox_ec2_allow_egress_cidrs_list
  egress_rules      = ["all-all"]
  tags = {
    Terraform = true
    Name = var.secgroup_jumpbox_ec2_group_name
    Product = var.secgroup_product_name
    ENV = var.secgroup_environment
  }
}

# Creating Security Group for ALB instance
module "public_elb_security_group" {
  source                                   = "terraform-aws-modules/security-group/aws"
  vpc_id                                   = var.secgroup_network_vpc_id
  name                                     = var.secgroup_public_elb_group_name
  description                              = "Security Group for elb"
  ingress_rules            = var.secgroup_public_elb_group_rule_list
  ingress_cidr_blocks      = var.secgroup_public_elb_allow_ingress_waf_cidrs_list
  egress_cidr_blocks      = var.secgroup_public_elb_allow_egress_cidrs_list
  egress_rules      = ["all-all"]
  tags = {
    Terraform = true
    Name = var.secgroup_public_elb_group_name
    Product = var.secgroup_product_name
    ENV = var.secgroup_environment
  }
}

# Creating Security Group for ECS instance
module "app_ecs_security_group" {
  source                                   = "terraform-aws-modules/security-group/aws"
  vpc_id                                   = var.secgroup_network_vpc_id
  name                                     =var.secgroup_app_ecs_group_name
  description                              = "Security Group EC2"
  ingress_with_self = [
    {
      from_port                     = var.secgroup_app_ecs_from_port
      to_port                       = var.secgroup_app_ecs_to_port
      protocol                      = "tcp"
      description                   = "self security group ecs tasks"
    },
  ]
  computed_ingress_with_source_security_group_id = [
    {
      from_port                     = var.secgroup_app_ecs_from_port
      to_port                       = var.secgroup_app_ecs_to_port
      protocol                      = "tcp"
      description                   = "security group from elb to ecs tasks"
      source_security_group_id = module.public_elb_security_group.security_group_id
    },
    {
      from_port                     = var.secgroup_app_ecs_from_port
      to_port                       = var.secgroup_app_ecs_to_port
      protocol                      = "tcp"
      description                   = "allow scheduler to ecs_task"
      source_security_group_id = module.scheduler_ec2_security_group.security_group_id
    },
    {
      from_port                     = var.secgroup_app_ecs_from_port
      to_port                       = var.secgroup_app_ecs_to_port
      protocol                      = "tcp"
      description                   = "allow jumpbox to ecs_task"
      source_security_group_id = module.jumpbox_ec2_security_group.security_group_id
    },
  ]
  number_of_computed_ingress_with_source_security_group_id = 3
  egress_cidr_blocks      = var.secgroup_app_ecs_allow_egress_cidrs_list
  egress_rules      = ["all-all"]

  tags = {
    Terraform = true
    Name = var.secgroup_app_ecs_group_name
    Product = var.secgroup_product_name
    ENV = var.secgroup_environment
  }
}

# Creating Security Group for database instance
module "single_multiregion_rds_security_group" {
  source                                   = "terraform-aws-modules/security-group/aws"
  vpc_id                                   = var.secgroup_network_vpc_id
  name                                     = var.secgroup_single_multiregion_rds_group_name
  description                              = "Security Group for mysql on ports"

  ingress_with_cidr_blocks = [
    {
      from_port                             = var.secgroup_single_multiregion_rds_from_port
      to_port                               = var.secgroup_single_multiregion_rds_to_port
      protocol                              = "tcp"
      description                           = "access to mysql on ports"
      cidr_blocks                           = var.secgroup_single_multiregion_rds_allowed_ingress_cidr
    }
  ]
  computed_ingress_with_source_security_group_id = [
    {
      from_port                             = var.secgroup_single_multiregion_rds_from_port
      to_port                               = var.secgroup_single_multiregion_rds_to_port
      protocol = "tcp"
      source_security_group_id = module.app_ecs_security_group.security_group_id
    },
    {
      from_port                             = var.secgroup_single_multiregion_rds_from_port
      to_port                               = var.secgroup_single_multiregion_rds_to_port
      protocol = "tcp"
      source_security_group_id = module.jumpbox_ec2_security_group.security_group_id
    },
    {
      from_port                             = var.secgroup_single_multiregion_rds_from_port
      to_port                               = var.secgroup_single_multiregion_rds_to_port
      protocol = "tcp"
      description                           = "Allow scheduler to mysql"
      source_security_group_id = module.scheduler_ec2_security_group.security_group_id
    },
  ]
  number_of_computed_ingress_with_source_security_group_id = 3
  egress_cidr_blocks      = var.secgroup_mysql_allow_egress_cidrs_list
  egress_rules      = ["all-all"]

  tags = {
    Terraform = true
    Name = var.secgroup_single_multiregion_rds_group_name
    Product = var.secgroup_product_name
    ENV = var.secgroup_environment
  }
}
