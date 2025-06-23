#!/bin/bash

cd terraform || exit 
EC2_IP=$(terraform output -raw instance_ip)

cat <<EOF > ../ansible/inventory.ini
[ec2]
$EC2_IP ansible_user=ubuntu ansible_ssh_private_key_file=/home/gowtham/Downloads/key_pair/ec2.pem
EOF
