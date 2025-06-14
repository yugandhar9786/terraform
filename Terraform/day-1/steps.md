# Terraform AWS EC2 Example

## Overview

This project demonstrates how to use Terraform to provision an AWS EC2 instance.

## Steps

### 1. Create Project Directory and Configuration File

Create a directory for your Terraform project and add a configuration file (usually named `main.tf`). Below is a basic example:

```hcl
provider "aws" {
  region = "us-east-1"  # Set your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Specify an appropriate AMI ID
  instance_type = "t2.micro"
}

### 2. Initialize Terraform
In your terminal, navigate to the directory containing your Terraform configuration files and run:
```bash
terraform init

This command initializes the Terraform working directory and downloads necessary provider plugins.

### 3. Apply the Configuration
```bash
terraform apply

Terraform will show a plan of changes. Type yes to approve and apply the changes.

### 4. Verify Resources
After Terraform completes provisioning, verify the resources using the AWS Management Console or the AWS CLI.

### 5. Destroy Resources
To remove the resources created by Terraform, use:
```bash
terraform destroy