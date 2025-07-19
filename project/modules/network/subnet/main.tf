# 2 public subnets 1--> 10.0.0.0/24  , 2 --> 10.0.2.0/24
# 2 private subnets 1--> 10.0.1.0/24  , 2 --> 10.0.3.0/24

# public subnet (10.0.0.0/24) and private subnet (10.0.1.0/24) in az us-east-1
# public subnet (10.0.2.0/24) and private subnet (10.0.3.0/24) in az us-east-2


##----------------------- public subnets -----------------------

resource "aws_subnet" "public-subnet-1" {
  vpc_id = var.vpc_id
  cidr_block = var.public_subnet_cidr_block_1
  availability_zone = var.azs[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet 1"
  }
}


resource "aws_subnet" "public-subnet-2" {
  vpc_id = var.vpc_id
  cidr_block = var.public_subnet_cidr_block_2
  availability_zone = var.azs[1]
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet 2"
  }
}


##----------------------- private subnets -----------------------
resource "aws_subnet" "private-subnet-1" {
  vpc_id = var.vpc_id
  cidr_block = var.private_subnet_cidr_block_1
  availability_zone = var.azs[0]
  tags = {
    Name = "Private Subnet 1"
  }
}


resource "aws_subnet" "private-subnet-2" {
  vpc_id = var.vpc_id
  cidr_block = var.private_subnet_cidr_block_2
  availability_zone = var.azs[1]
  tags = {
    Name = "Private Subnet 2"
  }
}