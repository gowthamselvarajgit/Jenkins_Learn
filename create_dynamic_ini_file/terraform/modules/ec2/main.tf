resource "aws_vpc" "mainVPC" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "subnet" {
  cidr_block = var.subnet_cidr
  vpc_id = aws_vpc.mainVPC.id
  availability_zone = "ap-south-1b"
}

resource "aws_internet_gateway" "public_rt" {
  vpc_id = aws_vpc.mainVPC.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.mainVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public_rt.id
  }
}

resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id = aws_subnet.subnet.id
  route_table_id = aws_route_table.public_rt.id  
}

resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.mainVPC.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2MyInstance" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  associate_public_ip_address = true
  tags = {
    Name = var.name
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ../ansible/ec2_ip.txt"
  }
}
