output "output_rds_aurora_multiregion_writer_endpoint" {
  value = module.rds_aurora.cluster_endpoint
}

output "output_rds_aurora_multiregion_reader_endpoint" {
  value = module.rds_aurora.cluster_reader_endpoint
}

output "output_rds_aurora_multiregion_cluster_instances" {
  value = module.rds_aurora.cluster_instances
}

output "output_rds_aurora_multiregion_cluster_members" {
  value = module.rds_aurora.cluster_members
}

output "output_rds_aurora_multiregion_cluster_master_username" {
  value = module.rds_aurora.cluster_master_username
}

output "output_rds_aurora_multiregion_cluster_master_password" {
  value = module.rds_aurora.cluster_master_password
}

