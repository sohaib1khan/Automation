#!/bin/bash

# Configurable Variables
BASE_DIR="/home"
USERNAME="devops"
SSH_KEY="/root/.ssh/id_rsa"
VM_IP="192.168.1.52"  # You can also use a command to populate this dynamically
ANSIBLE_FILE="k8s-setup.yaml"

# Function for error checking
check_error() {
    if [ $? -ne 0 ]; then
        echo "$1 failed."
        exit 1
    fi
}

# Main Script
echo "Current directory: $(pwd)"

# Initialize Terraform
cd "${BASE_DIR}/terraform" || exit 1
echo "Current directory: $(pwd)"
terraform init
check_error "Terraform initialization"

# Prompt user for action
echo "Choose an option for the Terraform configuration: "
echo "1) Apply"
echo "2) Destroy"
read -r action

# Main Action
case $action in
    1)
      terraform apply -var-file=.secrets.tfvars -auto-approve
      check_error "Terraform apply"
  
      # Sleep to allow VM to fully initialize (if necessary)
      sleep 30s
  
      # Change to Ansible directory
      cd "${BASE_DIR}/ansible" || exit 1
      echo "Current directory: $(pwd)"
  
      # Run Ansible playbook
      ansible-playbook -i "${VM_IP}," -e "ansible_ssh_user=${USERNAME} ansible_ssh_private_key_file=${SSH_KEY}" -e 'ansible_ssh_common_args="-o StrictHostKeyChecking=no"' ${ANSIBLE_FILE}
      check_error "Ansible playbook execution"
      ;;
  
    2)
      terraform destroy -var-file=.secrets.tfvars -auto-approve
      check_error "Terraform destroy"
      ;;
  
    *)
      echo "Invalid option. Please select 1 (for apply) or 2 (for destroy)."
      exit 1
      ;;
esac
