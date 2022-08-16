variable "network_private_subnets_cidrs" {
  type = list(string)
}
variable "network_public_subnets_cidrs" {
  type = list(string)
}
variable "network_private_database_subnets_cidrs" {
  type = list(string)
}
variable "network_availability_zones" {
  type = list(string)
}
variable "network_name" {}
variable "network_cidr" {}
variable "network_enable_hostname" {}
variable "network_enable_nat_gateway" {}
variable "network_enable_single_nat_gateway" {}
variable "network_create_database_subnet" {
  type = bool
}
variable "network_database_subnet_group_name" {}
variable "network_global_environment" {}

variable "network_product_name" {}
variable "network_caller_id" {}