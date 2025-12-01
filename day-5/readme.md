# 📌 Terraform Variables Demo — S3 Bucket Example (Day 5/28)

This project demonstrates **Terraform Input, Local, and Output variables** using a simple **AWS S3 bucket deployment**.

---

## 🎯 Concepts Covered

| Variable Type | Purpose | Equivalent in Programming |
|--------------|---------|---------------------------|
| **Input Variables** | Accept values from outside | Function parameters |
| **Local Variables** | Compute and reuse values | Local variables |
| **Output Variables** | Display values after deployment | Return values |

---

## 📁 Project Structure

```
├── provider.tf        # AWS provider configuration
├── main.tf            # S3 bucket resource
├── variables.tf       # Input variables
├── locals.tf          # Local variables
├── output.tf          # Output variables
├── terraform.tfvars   # Default values
└── README.md          # Documentation
```

---

## 🏗️ Architecture Diagram

```
           ┌──────────────────────────┐
           │  terraform.tfvars / CLI  │
           │   / defaults / env vars  │
           └─────────────┬────────────┘
                         │
                         ▼
               ┌─────────────────────┐
               │   Input Variables   │ (var.environment, var.bucket_name)
               └─────────────┬──────┘
                             │
                             ▼
                   ┌─────────────────┐
                   │ Local Variables │ (computed name, tags)
                   └─────────┬──────┘
                             │
                             ▼
                  ┌────────────────────┐
                  │   S3 Bucket (AWS)  │
                  └──────────┬────────┘
                             │
                             ▼
                   ┌──────────────────┐
                   │ Output Variables │
                   │ bucket name, arn │
                   └──────────────────┘
```

---

## 🔄 Flow Chart — Terraform Variable Lifecycle

```
       ┌─────────────┐
       │ terraform   │
       │    apply    │
       └──────┬──────┘
              ▼
   ┌──────────────────────┐
   │ Load Input Variables  │
   │ (defaults → tfvars →  │
   │ CLI → env precedence) │
   └─────────┬─────────────┘
             ▼
   ┌──────────────────────┐
   │ Compute Locals       │
   │ (full bucket name,   │
   │ tags, suffix, etc.)  │
   └─────────┬────────────┘
             ▼
   ┌──────────────────────┐
   │ Create Resources      │
   │ (aws_s3_bucket.demo)  │
   └─────────┬────────────┘
             ▼
   ┌──────────────────────┐
   │ Display Output       │
   │ (bucket, arn, env)   │
   └──────────────────────┘
```

---

## 🧩 Example Input Variables — `variables.tf`

```hcl
variable "environment" {
  description = "Environment name"
  type        = string
  default     = "staging"
}

variable "bucket_name" {
  description = "Base S3 bucket name"
  type        = string
  default     = "my-terraform-bucket"
}
```

---

## 🧮 Local Variables — `locals.tf`

```hcl
locals {
  common_tags = {
    Environment = var.environment
    Project     = "Terraform-Demo"
  }

  full_bucket_name = "${var.environment}-${var.bucket_name}-${random_string.suffix.result}"
}
```

---

## 📤 Output Variables — `output.tf`

```hcl
output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.demo.bucket
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.demo.arn
}

output "environment" {
  description = "Environment used"
  value       = var.environment
}

output "tags" {
  description = "Tags applied to the S3 bucket"
  value       = local.common_tags
}
```

---

## 🚀 Run the Project

```bash
terraform init
terraform plan
terraform apply -auto-approve
terraform output
```

To destroy:

```bash
terraform destroy -auto-approve
```

---

## 🧪 Variable Precedence Test

| Priority | Source |
|----------|--------|
| 🔥 Highest | Command line `-var` |
| | `*.tfvars` file |
| | Environment variables (`TF_VAR_...`) |
| ❄️ Lowest | Default in `variables.tf` |

Example override:

```bash
terraform plan -var="environment=production"
```

---

## 📤 Viewing Outputs

```bash
terraform output
terraform output -json
terraform output bucket_name
```

Example output:

```
bucket_arn = "arn:aws:s3:::demo-terraform-demo-bucket-abc123"
bucket_name = "demo-terraform-demo-bucket-abc123"
environment = "demo"
tags = {
  Environment = "demo"
  Project     = "Terraform-Demo"
}
```

---

## 💡 Key Takeaways

| Concept | Purpose |
|--------|---------|
| Input Variables | Parameters for Terraform |
| Local Variables | Calculated reusable values |
| Output Variables | Give meaningful results after creation |

📌 **Mastering Terraform variables is the foundation for building reusable modules and production-grade infrastructure.**

---

🔚 **End of README — Happy Terraforming! 🌍**
