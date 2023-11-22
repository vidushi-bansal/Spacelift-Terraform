output "vpc_id" {
    description = "ID of the VPC created"
    value = aws_vpc.my_vpc.id
}

output "sunbet_id" {
    description = "ID of the VPC created"
    value = aws_subnet.my_subnet.id
}