output "output_ec2instances_ids" {
  value = aws_instance.ec2_instance.*.id
}

output "output_ec2instance_private_ips" {
  value = aws_instance.ec2_instance.*.private_ip
}


output "output_ec2instance_network_interface_ids" {
  value = aws_instance.ec2_instance.*.primary_network_interface_id
}
