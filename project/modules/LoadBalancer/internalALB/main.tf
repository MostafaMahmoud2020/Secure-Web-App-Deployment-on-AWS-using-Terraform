resource "aws_lb" "internal_alb" {
  name = "app-internal-alb"
  internal = true
  load_balancer_type = "application"
  security_groups = [var.sg]
  subnets = var.subnets
}

resource "aws_lb_target_group" "internal_alb_target_group" {
  name = "internal-alb-target-group"
  port = 8080
  protocol = "HTTP"
  vpc_id = var.vpc_id
}


resource "aws_lb_listener" "public_alb_listener" {
  load_balancer_arn = aws_lb.internal_alb.arn
  port = "8080"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.internal_alb_target_group.arn
  }
  
}