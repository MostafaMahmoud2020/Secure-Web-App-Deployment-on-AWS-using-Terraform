resource "aws_lb" "public_alb" {
  name = "public-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [var.sg]
  subnets = var.subnets

provisioner "local-exec" {
      command = "echo 'public ALB dns : ${self.dns_name}' >> /home/mostafa/terralab/final-project/project/all-ips.txt" 
    }
  
}

resource "aws_lb_target_group" "public_alb_target_group" {
  name = "public-alb-target-group"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
}


resource "aws_lb_listener" "public_alb_listener" {
  load_balancer_arn = aws_lb.public_alb.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.public_alb_target_group.arn
  }
  
}