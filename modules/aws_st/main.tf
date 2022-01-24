# vpc
resource "aws_vpc" "myvpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    "Name" = "myvpc"
  }
}

# master subnet
resource "aws_subnet" "master-sub" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.10.10.0/24"
  availability_zone       = var.az-a
  map_public_ip_on_launch = true
  tags = {
    "Name" = "master-sub"
  }
}

# worker subnet
resource "aws_subnet" "worker-sub" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.10.20.0/24"
  availability_zone       = var.az-b
  map_public_ip_on_launch = true
  tags = {
    "Name" = "worker-sub"
  }
}

#igw
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    "Name" = "igw"
  }
}

# rt
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    "Name" = "rt"
  }

}
