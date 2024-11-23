provider "aws" {
  region = var.region
}

resource "aws_instance" "example_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.example_sg.id]

  tags = {
    Name = "ExampleInstance"
  }
}
