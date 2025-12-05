provider "aws" {
  region = "ap-south-1"
}

# VPC
resource "aws_vpc" "interview_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Interview-Vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.interview_vpc.id

  tags = {
    Name = "Interview-IGW"
  }
}

# Public Subnet 1
resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.interview_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Interview-subnet-public1"
  }
}

# Public Subnet 2
resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.interview_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Interview-subnet-public2"
  }
}

# Private Subnet 1
resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.interview_vpc.id
  cidr_block        = "10.0.101.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "Interview-subnet-private1"
  }
}

# Private Subnet 2
resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.interview_vpc.id
  cidr_block        = "10.0.102.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "Interview-subnet-private2"
  }
}
