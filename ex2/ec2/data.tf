data "aws_ami" "my_ami" {
  most_recent      = true
  name_regex       = "base-image-ansible"
  owners           = ["self"]
}