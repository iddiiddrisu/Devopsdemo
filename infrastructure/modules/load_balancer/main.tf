######################################################################
###################### ALB Section ###################################
#Creating target group for http to be attached to ALB
resource "aws_lb_target_group" "http_backend_target_group" {
  vpc_id      = var.load_balancer_vpc_id
  target_type = "ip"
  protocol    = "HTTP"
  port        = 80
  name        = var.load_balancer_default_targetgroup_name
  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 3
    enabled             = true
    interval            = 6
    timeout             = 5
    path                = "/"
    port                = 80
    protocol            = "HTTP"
  }
}

#creating Application Load balancer
resource "aws_lb" "lb" {
  name = var.load_balancer_lbname
  internal = "false"
  load_balancer_type = "application"
  security_groups = var.load_balancer_security_group_ids_list
  subnets = var.load_balancer_subnet_ids_list

}

#attaching http target group to http listener on ALB
resource "aws_lb_listener" "https_lb_listener" {
  load_balancer_arn = aws_lb.lb.arn
  protocol = "HTTP"
  port = "80"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.http_backend_target_group.arn
  }
}
