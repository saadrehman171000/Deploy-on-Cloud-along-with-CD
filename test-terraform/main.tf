# main.tf

provider "aws" {
  region = "us-west-2"  # Change to your preferred region
}

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Create Subnets
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-2b"
}

# Create Security Group
resource "aws_security_group" "sec_group" {
  name        = "test-sec-group"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.main.id
}

# Launch EC2 Instance
resource "aws_instance" "web" {
  ami             = "ami-0c55b159cbfafe1f0"  # Replace with a valid AMI ID in your region
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.subnet1.id
  security_groups = [aws_security_group.sec_group.name]
  
  tags = {
    Name = "TestInstance"
  }
}

# Output the instance public IP
output "instance_public_ip" {
  value = aws_instance.web.public_ip
}
