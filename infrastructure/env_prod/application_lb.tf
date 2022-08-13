module "alb" {
  source = "../modules/load_balancer"
  load_balancer_default_targetgroup_name ="${local.global_prefix}-${var.var_load_balancer_default_tg_name}"
  load_balancer_lbname = "${local.global_prefix}-${var.var_load_balancer_name}"
  load_balancer_security_group_ids_list = [module.securitygroups.output_secgroup_elb_group_id]
  load_balancer_subnet_ids_list = module.vpc.output_vpc_public_subnet_ids
  load_balancer_vpc_id = module.vpc.output_vpc_vpc_id
}