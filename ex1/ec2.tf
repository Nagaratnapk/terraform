provider "aws" {
    region      = "us-east-1"
}

resource "aws_instance" "demo1" {
  ami                       = "ami-0dd0cf8e59642ecb7"
  instance_type             = "t2.micro"
  vpc_security_group_ids    = [aws_security_group.allows_ssh.id]

  tags     = {
    Name   = "EC2-Terraform"
  }
}

output "public_ip" {
    value  = aws_instance.demo1.public_ip
}


# Creates security group
resource "aws_security_group" "allows_ssh" {
  name        = "allows_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description      = "SSH from INTERNET"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssg_sg"
  }
}