variable "vpc_id" {
    description = "VPC ID where the subnets will be created"
    type        = string    
}


variable "proxy_sg_id" {
    description = "VPC ID where the subnets will be created"
    type        = string
  
}

variable "cidr_block_private_subnet_1" {
   type = string
   default = "10.0.0.0/24"
  
}

variable "cidr_block_private_subnet_2" {
   type = string
   default = "10.0.2.0/24"
  
}