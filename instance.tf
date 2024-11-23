provider "aws" {
  region = "us-east-1" # Replace with your preferred region
}

# Security Group
resource "aws_security_group" "example_sg" {
  name        = "example-security-group"
  description = "Allow SSH and HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere; adjust for your security needs
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP traffic
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "example_instance" {
  ami           = "ami-08bc77a2c7eb2b1da" # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"

  key_name = "my-key-pair" # Replace with your key pair name

  vpc_security_group_ids = [aws_security_group.example_sg.id]

  tags = {
    Name = "ExampleInstance"
  }
}
