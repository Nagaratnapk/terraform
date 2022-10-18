provider "aws" {
    region      = "us-east-1"
}

resource "aws_spot_instance_request" "spot_worker" {
  ami                       = data.aws_ami.my_ami.id
  instance_type             = "t3.micro"
  wait_for_fulfillment      = true 
  vpc_security_group_ids    = [aws_security_group.allows_ssh.id]
  availability_zone         = "us-east-1d"

  tags = {
    Name = var.COMPONENT
  }

  provisioner "remote-exec" {
  
  # Connection Provisioner
  connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = self.public_ip
  }

    inline = [
     "ansible-pull -U https://github.com/Nagaratnapk/ansible.git -e COMPONENT=frontend -e ENV=dev -e APP_VERSION=0.0.3 roboshop-pull.yml",
    ]
  }

}