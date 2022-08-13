output "output_secgroup_elb_group_id" {
  value = module.public_elb_security_group.security_group_id
}

output "output_secgroup_ecs_group_id" {
  value = module.app_ecs_security_group.security_group_id
}

output "output_secgroup_jumpbox_group_id" {
  value = module.jumpbox_ec2_security_group.security_group_id
}

output "output_secgroup_mysql_group_id" {
  value = module.single_multiregion_rds_security_group.security_group_id
}

output "output_secgroup_mysql_group_name" {
  value = module.single_multiregion_rds_security_group.security_group_name
}

