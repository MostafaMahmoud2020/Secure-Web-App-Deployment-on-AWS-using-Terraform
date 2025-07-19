resource "aws_route_table" "rt_natGateway_1" {
    vpc_id = var.vpc_id
    route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = var.nat_gateway_id_1
    }
    tags = {
      Name = "nat-rt_1"
    }
  
}


resource "aws_route_table" "rt_natGateway_2" {
    vpc_id = var.vpc_id
    route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = var.nat_gateway_id_2
    }
    tags = {
      Name = "nat-rt_2"
    }
  
}


resource "aws_route_table" "rt_public" {
    vpc_id = var.vpc_id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = var.igw_id
    }
    tags = {
      Name = "public-rt"
    }
  
}
