variable "vpc_id" {
    description = "VPC ID where the subnets will be created"
    type        = string
}

variable "nat_gateway_id_1" {
    description = " nat gateway id"
    type        = string
}

variable "nat_gateway_id_2" {
    description = " nat gateway id"
    type        = string
}


variable "igw_id" {
    description = " internet gateway id"
    type        = string
  
}