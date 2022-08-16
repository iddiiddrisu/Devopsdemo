######################################################################
###################### EC2 Implementation ############################
module "jumpbox_instance" {
  source = "../modules/ec2_instance"
  ec2instance_ami_id = data.aws_ami.ec2_instance_type.id
  ec2instance_az_name_list = data.aws_availability_zones.azs.names
  ec2instance_count = 1
  ec2instance_env_name = "${local.global_prefix}-jumpbox"
  ec2instance_environment = var.var_global_aws_environment
  ec2instance_iam_profile_name = module.iam.output_instance_profile_name
  ec2instance_instance_class = "t3.micro"
  ec2instance_name = "${var.var_global_product}-jumpbox"
  ec2instance_product_name = var.var_global_product
  ec2instance_root_ebs_volume_size = "30"
  ec2instance_root_ebs_volume_type = "gp3"
  ec2instance_should_enable_public_ip = true
  ec2instance_should_root_block_encrypted = true
  ec2instance_ssh_key_name = "${var.var_global_aws_environment}_${var.var_global_product}.pem"
  ec2instance_subnet_id_list = module.vpc.output_vpc_public_subnet_ids
  ec2instance_private_ips_list = ["10.20.0.20"]
  ec2instance_security_group_id_list = [module.securitygroups.output_secgroup_jumpbox_group_id]
}
