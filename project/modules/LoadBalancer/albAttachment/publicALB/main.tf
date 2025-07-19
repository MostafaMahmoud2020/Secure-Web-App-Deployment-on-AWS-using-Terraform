resource "aws_lb_target_group_attachment" "frontend_1" {
  target_group_arn = var.frontend_target_group_arn
  target_id       = var.frontend_instance1_id
  port            = 80
}




resource "aws_lb_target_group_attachment" "frontend_2" {
  target_group_arn = var.frontend_target_group_arn
  target_id       = var.frontend_instance2_id
  port            = 80
}