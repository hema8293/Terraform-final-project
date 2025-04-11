# Terraform Final Project - AWS Infrastructure Setup

## Project Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform to provision and manage AWS resources. It automates the creation of:

- VPC
- Public Subnet
- EC2 Instance
- S3 Bucket for Terraform State File Storage
- DynamoDB Table for Terraform State Locking
- Security Group to Allow SSH & HTTP/HTTPS Access

---

## Technologies Used
- Terraform v1.x
- AWS Provider v5.x
- AWS Cloud Resources:
  - VPC
  - Subnet
  - EC2 Instance
  - Security Group
  - S3 Bucket
  - DynamoDB Table

---

## Terraform Files Explanation

| File Name         | Description                                                     |
|------------------|-----------------------------------------------------------------|
| main.tf           | Contains AWS VPC, Subnet, EC2 instance, Security Group         |
| variables.tf      | Defines all input variables                                    |
| terraform.tfvars  | Contains actual values of variables (Except Sensitive data)    |
| backend.tf        | Defines Remote Backend using S3 and DynamoDB for State Locking |
| outputs.tf        | Displays EC2 Instance Public IP after apply                    |
| provider.tf       | AWS Provider Configuration                                     |

---

## Variable Definitions

Variables are defined in:
- `variables.tf`

Variable values provided in:
- `terraform.tfvars`

Example variables:
```hcl
region         = "us-east-1"
vpc_cidr_block = "10.0.0.0/16"
subnet_cidr    = "10.0.1.0/24"
instance_type  = "t2.micro"
bucket_name    = "priya-tfstate-2025"
dynamodb_table = "terraform-lock"
Terraform Backend Configuration
Defined in backend.tf:

terraform {
  backend "s3" {
    bucket         = "priya-tfstate-2025"
    key            = "terraform/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}
Execution Steps
# Initialize Terraform
terraform init

# Plan Changes
terraform plan

# Apply Changes
terraform apply

# Output EC2 Public IP
terraform output
Output
Example Output:

ec2_public_ip = "44.200.17.117"
AWS Resources Created
VPC: 10.0.0.0/16

Subnet: 10.0.1.0/24

EC2 Instance: t2.micro (Amazon Linux)

S3 Bucket: priya-tfstate-2025 (With Versioning Enabled)

DynamoDB Table: terraform-lock (For State Locking)

Security Group: Allow Port 22 (SSH), Port 80 & 443 (HTTP/HTTPS)

Repository URL
GitHub Repository: Terraform Final Project