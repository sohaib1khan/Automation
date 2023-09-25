#!/bin/bash

# Set BASE_DIR to the absolute path
BASE_DIR="/home"
echo "Current directory: $(pwd)"

# Change to Terraform directory
cd "${BASE_DIR}/terraform"
echo "Current directory: $(pwd)"
terraform init

# Prompt user for action
echo "Choose an option for the Terraform configuration: "
echo "1) Apply"
echo "2) Destroy"
read -r action

case $action in
    1)
      terraform apply -var-file=.secrets.tfvars -auto-approve
  
      # Static IP address of the VM
      VM_IP="192.168.1.52"
      sleep 30s
  
      # Return to base directory
      cd "${BASE_DIR}"
      echo "Current directory: $(pwd)"
  
      # Run Ansible playbook
      cd "${BASE_DIR}/ansible"
      echo "Current directory: $(pwd)"
  
      ansible-playbook -i "${VM_IP}," -e "ansible_ssh_user=devops ansible_ssh_private_key_file=/root/.ssh/id_rsa" -e 'ansible_ssh_common_args="-o StrictHostKeyChecking=no"' setup.yml
      ;;

    2)
      terraform destroy -var-file=.secrets.tfvars -auto-approve
      ;;

    *)
      echo "Invalid option. Please select 1 (for apply) or 2 (for destroy)."
      exit 1
      ;;
esac
