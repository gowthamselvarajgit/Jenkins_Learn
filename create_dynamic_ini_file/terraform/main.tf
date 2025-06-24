provider "aws" {
  region = "ap-south-1"
}

module "ec2" {
  source = "./modules/ec2"
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  name = var.name
}