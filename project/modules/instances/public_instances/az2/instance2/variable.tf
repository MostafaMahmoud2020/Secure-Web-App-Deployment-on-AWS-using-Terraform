variable "instance_type" {
  default = "t2.micro"
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "key_name" {
  default = "test"
  type = string
}

variable "sg" {
  type = string
}

variable "internal_alb_dns_name" {
    type = string
  
}
