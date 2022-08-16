output "output_vpc_vpc_id" {
  value = module.network.vpc_id
}

output "output_vpc_internet_gw_arn" {
  value = module.network.igw_arn
}

output "output_vpc_internet_gw_id" {
  value = module.network.igw_id
}

output "output_vpc_public_route_table_ids" {
  value = module.network.public_route_table_ids
}

output "output_vpc_private_route_table_ids" {
  value = module.network.private_route_table_ids
}

output "output_vpc_database_route_table_ids" {
  value = module.network.database_route_table_ids
}

output "output_vpc_database_subnet_group_name" {
  value = module.network.database_subnet_group_name
}

output "output_vpc_public_subnet_ids" {
  value = module.network.public_subnets
}

output "output_vpc_database_subnet_ids" {
  value = module.network.database_subnets
}

output "output_vpc_private_subnet_ids" {
  value = module.network.private_subnets
}