variable "route_table_private_id_1" {
    description = "route table id"
    type        = string
}


variable "route_table_private_id_2" {
    description = "route table id"
    type        = string
}


variable "route_table_public_id" {
    description = "route table id"
    type        = string
}

##----------------------- private subnet 1 -----------------------
variable "private1_subnet_id" {
    description = "private subnet id"
    type        = string
}


## ---------------------- private subnet 2 -----------------------
variable "private2_subnet_id" {
    description = "private subnet id"
    type        = string
}



## ---------------------- public subnet 1 -----------------------
variable "public1_subnet_id" {
    description = "public subnet id"
    type        = string
}


## ---------------------- public subnet 2 -----------------------
variable "public2_subnet_id" {
    description = "public subnet id"
    type        = string
}
