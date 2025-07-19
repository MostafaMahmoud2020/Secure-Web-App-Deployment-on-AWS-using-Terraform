resource "aws_lb_target_group_attachment" "frontend_1" {
  target_group_arn = var.backend_target_group_arn
  target_id       = var.backend_instance1_id
  port            = 8080
}




resource "aws_lb_target_group_attachment" "frontend_2" {
  target_group_arn = var.backend_target_group_arn
  target_id       = var.backend_instance2_id
  port            = 8080
}



