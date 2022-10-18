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

  ingress {
    description      = "HTTP from INTERNET"
    from_port        = 80
    to_port          = 80
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


output "sg_id" {
    value =  aws_security_group.allows_ssh.id
}