resource "aws_eip" "eip_1" {}


resource "aws_nat_gateway" "natGateway_1" {
    allocation_id = aws_eip.eip_1.id
    subnet_id = var.public_subnet_id_1
    tags = {
      Name = "nat-gateway_1"
    }
}




resource "aws_eip" "eip_2" {}


resource "aws_nat_gateway" "natGateway_2" {
    allocation_id = aws_eip.eip_2.id
    subnet_id = var.public_subnet_id_2
    tags = {
      Name = "nat-gateway_2"
    }
}