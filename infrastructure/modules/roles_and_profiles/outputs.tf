output "output_instance_profile_name" {
  value = aws_iam_instance_profile.ec2_instance_profile.name
}

output "output_ecs_task_role_name" {
  value = aws_iam_role.ecs_task_iam_role.name
}

output "output_ecs_task_role_arn" {
  value = aws_iam_role.ecs_task_iam_role.arn
}

output "output_ec2_role_name" {
  value = aws_iam_role.ec2_iam_role.name
}

output "output_ec2_role_arn" {
  value = aws_iam_role.ec2_iam_role.arn
}

