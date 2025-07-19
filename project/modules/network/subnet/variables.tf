variable "vpc_id" {
  description = "VPC ID where the subnets will be created"
  type        = string
}

variable "azs" {
    type = list(string)
    default = ["us-east-1a", "us-east-1b"]
  
}

variable "public_subnet_cidr_block_1" {
    type = string
    default = "10.0.0.0/24"
    
}
variable "private_subnet_cidr_block_1" {
    type = string
    default = "10.0.1.0/24"
  
}


variable "public_subnet_cidr_block_2" {
    type = string
    default = "10.0.2.0/24"
  
}
variable "private_subnet_cidr_block_2" {
    type = string
    default = "10.0.3.0/24"
  
}