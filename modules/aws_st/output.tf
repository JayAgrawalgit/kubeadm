# vpc
output "vpc-id" {
  description = "vpc id"
  value = aws_vpc.myvpc.id
}

# master-sub
output "master-sub-id" {
  description = "taking subnate id"
  value       = aws_subnet.master-sub.id
}

# worker-sub
output "worker-sub-id" {
  description = "taking worker id"
  value       = aws_subnet.worker-sub.id
}

# igw-id
output "igw-id" {
  description = "internet gayeway id"
  value = aws_internet_gateway.igw.id
}

# rt-id
output "rt-id" {
  description = "route table id"
  value = aws_route_table.rt.id  
}

