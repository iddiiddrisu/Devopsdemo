output "output_network_vpc_id" {
  value = module.vpc.output_vpc_vpc_id
}

output "output_multiregion_aurora_cluster_members" {
  value = module.rds_aurora_multiregion.output_rds_aurora_multiregion_cluster_members
}

output "output_multiregion_aurora_cluster_instances" {
  value = module.rds_aurora_multiregion.output_rds_aurora_multiregion_cluster_instances
}

output "output_multiregion_aurora_cluster_writer_endpoint" {
  value = module.rds_aurora_multiregion.output_rds_aurora_multiregion_writer_endpoint
}

output "output_multiregion_aurora_cluster_reader_endpoint" {
  value = module.rds_aurora_multiregion.output_rds_aurora_multiregion_reader_endpoint
}

output "output_load_balancer_cname" {
  value = module.alb.output_load_balancer_dns_name
}

output "output_iam_profile_name" {
  value = module.iam.output_instance_profile_name
}