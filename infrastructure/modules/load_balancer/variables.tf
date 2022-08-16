variable "load_balancer_vpc_id" {}
variable "load_balancer_default_targetgroup_name" {}
variable "load_balancer_lbname" {}
variable "load_balancer_security_group_ids_list" {
  type = list(string)
}
variable "load_balancer_subnet_ids_list" {
  type = list(string)
}