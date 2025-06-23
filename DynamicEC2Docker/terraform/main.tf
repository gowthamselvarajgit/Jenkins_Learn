provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.subnet_id
  security_groups = [var.vpc_security_group_ids]
}