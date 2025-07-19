output "public_subnet_id_1" {
    value = aws_subnet.public-subnet-1.id
} 

output "public_subnet_id_2" {
    value = aws_subnet.public-subnet-2.id
}

output "private_subnet_id_1" {
    value = aws_subnet.private-subnet-1.id
}   

output "private_subnet_id_2" {
    value = aws_subnet.private-subnet-2.id
}

output "private_subnets" {
  value = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id]
}
