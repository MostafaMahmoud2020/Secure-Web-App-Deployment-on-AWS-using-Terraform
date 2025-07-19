output "internal_alb_arn" {
    value = aws_lb.internal_alb.arn
}

output "target_group_arn" {
    value = aws_lb_target_group.internal_alb_target_group.arn
  
}

output "internal_alb_dns_name" {
    value = aws_lb.internal_alb.dns_name
  
}