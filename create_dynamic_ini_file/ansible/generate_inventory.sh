#!/bin/bash

IP=$(terraform -chdir=../terraform output -raw instance_ip)

PEM_KEY_PATH=$1

if [ -z "$PEM_KEY_PATH" ]; then
    echo "PEM file path not provided"
    echo "Usage: ./generate_inventory.sh /path/to/key.pem"
    exit 1
fi

cat <<EOF > inventory.ini
[app]
$IP ansible_user=ubuntu ansible_ssh_private_key_file=$PEM_KEY_PATH
EOF
