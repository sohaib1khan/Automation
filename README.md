# Automation - Infrastructure as Code (IAC) Repository

This repository serves as a collection of various tools and configurations related to Infrastructure as Code (IAC). The aim is to provide streamlined methodologies to deploy, configure, and manage infrastructure using automated scripts and configuration management tools.

## Contents

- **Bash Scripts**: Automate various tasks, ranging from setting up environments to deploying specific configurations.
- **Ansible**: Configuration management tool to set up and configure servers.
- **Terraform**: Infrastructure provisioning tool that allows for declarative configuration of resources.
- **Python**: Custom scripts to complement other tools or provide additional functionalities.
- **Jenkins**: Continuous Integration and Continuous Deployment (CI/CD) tool to automate building, testing, and deploying code.

## Structure

- `ansible`: Directory containing Ansible playbooks and configurations.
- `terraform`: Directory with Terraform configurations for provisioning infrastructure.
- `jenkins`: Directory containing Jenkins pipelines and configurations.
- `deploy.sh`: Bash script that serves as an entry point for deploying and configuring the VM.
- `docker_env_setup.sh`: Bash script that sets up a Docker environment tailored for the IAC tasks.

## Goals

- **Automated Deployments**: Reduce manual intervention by automating as many tasks as possible.
- **Consistency**: Ensure consistent configurations across different environments.
- **Scalability**: The tools and configurations should support scaling as per the project needs.
- **Modularity**: Each tool or script should have a specific purpose, making it easier to understand and modify.

## Getting Started

1.  Clone the repository.
2.  Navigate to the desired directory/tool.
3.  Follow the specific README or instructions related to that tool.

## Jenkins Setup

1.  Ensure that Jenkins is installed and running either natively or in a Docker container.
2.  Create or import a Jenkinsfile from the `jenkins` directory.
3.  Configure credentials and other environment variables as specified in the Jenkinsfile.
4.  Trigger the build either manually or through webhooks.

