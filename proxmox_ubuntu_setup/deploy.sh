#!/bin/bash

# Change to the directory where the script resides
BASE_DIR="$(dirname "$0")"

# Apply Terraform configuration
cd "${BASE_DIR}/terraform"
terraform init
terraform apply -auto-approve

# Static IP address of the VM
VM_IP="192.168.1.50"
sleep 30s

# Return to base directory
cd "${BASE_DIR}"

# Run Ansible playbook
ansible-playbook -i "${VM_IP}," -e "ansible_ssh_user=vmtest ansible_ssh_private_key_file=/root/.ssh/id_rsa" -e 'ansible_ssh_common_args="-o StrictHostKeyChecking=no"' ansible/setup.yml
