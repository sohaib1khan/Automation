#!/bin/bash

# Get the AWS access key ID and secret access key from the credentials file
access_key=$(grep aws_access_key_id ~/.aws/credentials | cut -d' ' -f3)
secret_key=$(grep aws_secret_access_key ~/.aws/credentials | cut -d' ' -f3)

# Set the AWS access key ID and secret access key as environment variables
export AWS_ACCESS_KEY_ID=$access_key
export AWS_SECRET_ACCESS_KEY=$secret_key

# Log in to the AWS CLI
aws configure

# Confirm that you are logged in to the AWS CLI
aws sts get-caller-identity

# Function to list and optionally delete EC2 instances
list_ec2() {
  for region in $(aws ec2 describe-regions --output text --query 'Regions[].RegionName'); do
    echo "Listing EC2 instances in region $region"
    aws ec2 describe-instances --region $region
  done
}

# Function to list S3 buckets
list_s3() {
  echo "Listing S3 buckets"
  aws s3 ls
}

# Function to list and optionally delete VPCs
list_vpc() {
  for region in $(aws ec2 describe-regions --output text --query 'Regions[].RegionName'); do
    echo "Listing VPCs in region $region"
    aws ec2 describe-vpcs --region $region
  done
}

# Function to list and optionally delete EBS volumes
list_ebs() {
  for region in $(aws ec2 describe-regions --output text --query 'Regions[].RegionName'); do
    echo "Listing EBS volumes in region $region"
    aws ec2 describe-volumes --region $region
  done
}

# Function to list IAM users
list_iam() {
  echo "Listing IAM users"
  aws iam list-users
}

# Function to list and optionally delete security groups
list_sg() {
  for region in $(aws ec2 describe-regions --output text --query 'Regions[].RegionName'); do
    echo "Listing security groups in region $region"
    aws ec2 describe-security-groups --region $region
  done
}

# Main menu
PS3="Please choose an option: "
options=("List EC2 Instances" "List S3 Buckets" "List VPCs" "List EBS Volumes" "List IAM Users" "List Security Groups" "Quit")
select opt in "${options[@]}"
do
  case $opt in
    "List EC2 Instances")
      list_ec2
      ;;
    "List S3 Buckets")
      list_s3
      ;;
    "List VPCs")
      list_vpc
      ;;
    "List EBS Volumes")
      list_ebs
      ;;
    "List IAM Users")
      list_iam
      ;;
    "List Security Groups")
      list_sg
      ;;
    "Quit")
      break
      ;;
    *)
      echo "Invalid option $REPLY"
      ;;
  esac
done