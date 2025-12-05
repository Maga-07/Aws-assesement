output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.interview_vpc.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.interview_vpc.cidr_block
}

output "public_subnet_1_id" {
  description = "ID of Public Subnet 1"
  value       = aws_subnet.public1.id
}

output "public_subnet_2_id" {
  description = "ID of Public Subnet 2"
  value       = aws_subnet.public2.id
}

output "private_subnet_1_id" {
  description = "ID of Private Subnet 1"
  value       = aws_subnet.private1.id
}

output "private_subnet_2_id" {
  description = "ID of Private Subnet 2"
  value       = aws_subnet.private2.id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}
