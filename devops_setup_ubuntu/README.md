# Proxmox Ubuntu Machine  Setup with DevOps tools

This repository contains scripts and configurations to set up a Proxmox virtual machine using Terraform and configure it using Ansible.

## Directory Structure

- `ansible`: Contains Ansible configurations.
    - `hosts.ini`: Ansible inventory file.
    - `setup.yml`: Ansible playbook to configure the VM.
- `terraform`: Contains Terraform configurations to create the VM.
- `deploy.sh`: Script to deploy and configure the VM.
- `docker_env_setup.sh`: Script to set up a Docker environment with necessary tools to run the project.

## Prerequisites

- Terraform installed
- Ansible installed
- Docker and Docker Compose (optional, for the Docker environment)

🔴 **IMPORTANT**: Before proceeding, ensure you update the `.secrets.tfvars` file inside the `terraform` directory with the necessary secret variables (e.g., your Proxmox credentials).

## Running the Project

### Using Docker (Recommended)

1.  Execute the `docker_env_setup.sh` script:

```
./docker_env_setup.sh
```

This will create a Docker environment with Terraform, Ansible, and other required tools.

2.  Once inside the Docker container, run the `deploy.sh` script to deploy and configure the VM:

```
./deploy.sh
```

## Making Changes

- **Terraform**: If you wish to adjust the VM setup (e.g., memory, CPU, storage), make modifications in the `terraform` directory files.
    
Remember to update the `.secrets.tfvars` with your Proxmox credentials and other secret variables.

`.secrets.tfvars` - values

```
pm_user     = "USERNAME"
pm_password = "PASSWORD"
ciuser      = "UaerName"
cipassword  = "SomePassword"
```

    
- **Ansible**: Adjustments related to VM configuration after deployment (e.g., installed packages, users) should be done in the `ansible` directory files.
    

## IP Address

The default IP address of the deployed VM is `192.168.1.55`. Update this IP address in the `deploy.sh` script if needed.

## Note

Ensure you have appropriate permissions to run the scripts. Use the `chmod +x <script-name>.sh` command if required.