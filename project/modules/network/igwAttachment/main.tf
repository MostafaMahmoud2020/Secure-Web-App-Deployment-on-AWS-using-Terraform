resource "aws_route_table_association" "private1" {
    subnet_id      = var.private1_subnet_id
    route_table_id = var.route_table_private_id_1
}


resource "aws_route_table_association" "private2" {
    subnet_id      = var.private2_subnet_id
    route_table_id = var.route_table_private_id_2
}


resource "aws_route_table_association" "public1" {
    subnet_id      = var.public1_subnet_id
    route_table_id = var.route_table_public_id
  
}


resource "aws_route_table_association" "public2" {
    subnet_id      = var.public2_subnet_id
    route_table_id = var.route_table_public_id
}