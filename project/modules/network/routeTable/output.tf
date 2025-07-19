output "route_table_nat_id_1" {
    value = aws_route_table.rt_natGateway_1.id
  
}


output "route_table_nat_id_2" {
  value = aws_route_table.rt_natGateway_2.id
}


output "route_table_public_id" {
    value = aws_route_table.rt_public.id    
  
}