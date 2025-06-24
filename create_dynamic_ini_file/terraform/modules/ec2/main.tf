resource "aws_instance" "ec2MyInstance" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name

  tags = {
    Name = var.name
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ../ansible/ec2_ip.txt"
  }
}
