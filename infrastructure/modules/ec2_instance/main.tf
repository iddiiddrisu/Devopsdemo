resource "aws_instance" "ec2_instance" {
  ami = var.ec2instance_ami_id
  instance_type = var.ec2instance_instance_class
  key_name = var.ec2instance_ssh_key_name
  associate_public_ip_address = var.ec2instance_should_enable_public_ip
  subnet_id = element(var.ec2instance_subnet_id_list,count.index )
  private_ip = element(var.ec2instance_private_ips_list,count.index )
  count = var.ec2instance_count
  iam_instance_profile = var.ec2instance_iam_profile_name
  vpc_security_group_ids = var.ec2instance_security_group_id_list
  root_block_device {
    encrypted = var.ec2instance_should_root_block_encrypted
    tags = {
      Terraform = true
      Name = var.ec2instance_name
      Product = var.ec2instance_product_name
      ENV = var.ec2instance_environment
    }
    volume_size = var.ec2instance_root_ebs_volume_size
    volume_type = var.ec2instance_root_ebs_volume_type
  }

  tags = {
    Terraform = true
    Name = var.ec2instance_name
    EnvName = var.ec2instance_env_name
    AName = "${var.ec2instance_env_name}-${element(var.ec2instance_az_name_list,count.index )}"
    Product = var.ec2instance_product_name
    ENV = var.ec2instance_environment
  }
  user_data = file("${path.module}/files/cloud_init.sh")
}