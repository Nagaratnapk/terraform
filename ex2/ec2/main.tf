resource "aws_instance" "demo1" {
  ami                       = data.aws_ami.my_ami.id
  instance_type             = "t2.micro"
  vpc_security_group_ids    = [var.sg]

  tags     = {
    Name   = "EC2-Terraform"
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

variable "sg" {}

output "public_ip" {
    value =  aws_instance.demo1.public_ip
}