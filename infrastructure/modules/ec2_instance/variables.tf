variable "ec2instance_ami_id" {}
variable "ec2instance_instance_class" {}
variable "ec2instance_ssh_key_name" {}
variable "ec2instance_should_enable_public_ip" {}
variable "ec2instance_subnet_id_list" {
  type = list(string)
}
variable "ec2instance_az_name_list" {
  type = list(string)
}
variable "ec2instance_count" {}
variable "ec2instance_iam_profile_name" {}
variable "ec2instance_should_root_block_encrypted" {}
variable "ec2instance_name" {}
variable "ec2instance_product_name" {}
variable "ec2instance_environment" {}
variable "ec2instance_root_ebs_volume_size" {}
variable "ec2instance_root_ebs_volume_type" {}
variable "ec2instance_env_name" {}
variable "ec2instance_private_ips_list" {
  type = list(string)
}
variable "ec2instance_security_group_id_list" {
  type = list(string)
}