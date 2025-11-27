terraform {
    backend "s3" {
    bucket = "mybucket-terraform-state-2025-day04-challance-piyush"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = false
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create S3 Bucket
resource "aws_s3_bucket" "s3_bucket_Challange-day3" {
  bucket = "my-tf-test-bucket-challange"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# Enable Versioning on the S3 Bucket
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.s3_bucket_Challange-day3.id

  versioning_configuration {
    status = "Enabled"
  }
}

   