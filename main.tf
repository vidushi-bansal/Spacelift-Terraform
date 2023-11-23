# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block       = var.vpc_cidr

  tags = {
    Name = "VPC1"
  }
}

# Create a subnet
resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "SUBNET1"
  }
}

# Create a network interface
resource "aws_network_interface" "netin" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

# Create a new instance
resource "aws_instance" "instance" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.netin.id
    device_index         = 0
  }
}

# Create an S3 bucket
resource "aws_s3_bucket" "bucket" {
  bucket = "vidushi-spacelift-bucket"

  tags = {
    Name        = "vidushi-spacelift-bucket"
    Company      = "Knoldus-Nash"
  }
}