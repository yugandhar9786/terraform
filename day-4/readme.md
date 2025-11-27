# Day 4: State File Management - Remote Backend

## Topics Covered
- How Terraform updates Infrastructure
- Terraform state file
- State file best practices
- Remote backend setup with S3
- S3 Native State Locking (No DynamoDB required)
- State management

---

## How Terraform Updates Infrastructure
| Concept | Explanation |
|--------|-------------|
| Goal | Keep actual state same as desired state |
| State File | Actual state resides in `terraform.tfstate` |
| Process | Terraform compares current state with desired configuration |
| Updates | Only changes the resources that need modification |

---

## Terraform State File
The state file is a **JSON file** that contains:
- Resource metadata and current configuration
- Resource dependencies
- Provider information
- Resource attribute values

---

## State File Best Practices
✔ Never edit state file manually  
✔ Store state file remotely (not locally)  
✔ Enable state locking to prevent concurrent modifications  
✔ Backup state files regularly  
✔ Use separate state files for different environments  
✔ Restrict access to state files (contains sensitive data)  
✔ Encrypt state files at rest and in transit  

---

## Remote Backend Benefits
| Benefit | Description |
|--------|-------------|
| Collaboration | Team members can share state |
| Locking | Prevents concurrent operations |
| Security | Encrypted storage with access control |
| Backup | Automatic versioning and backups |
| Durability | Highly available storage |

---

## AWS Remote Backend Components
- **S3 Bucket** → Stores the state file
- **S3 Native State Locking** → Uses S3 conditional writes (no DynamoDB required)
- **IAM Policies** → Controls access

---

## S3 Native State Locking (Terraform 1.10+)
Terraform now supports **S3 native locking using S3 Conditional Writes**, so **no DynamoDB table is required**.

### How It Works
1. Terraform tries to create a lock file in S3 using `If-None-Match` conditional writes.
2. If lock exists → operation fails.
3. If lock doesn’t exist → lock file is created.
4. After completion → lock file is auto-removed (delete marker in versioning).

### Previous Method (Deprecated Soon)
| Property | DynamoDB Locking | S3 Native Locking |
|---------|------------------|------------------|
| Additional Service Required | Yes | No |
| Cost | DynamoDB R/W | Free |
| Setup | Medium | Very Easy |
| IAM | More complex | Simple |
| Future Support | May be deprecated | Recommended |

---

## Setup Remote Backend
### Step 1: Create S3 Bucket
Enable:
- Versioning
- Server-side encryption

### Example `backend.tf`
```hcl
terraform {
  backend "s3" {
    bucket       = "your-terraform-state-bucket"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}
```

🔹 `use_lockfile = true` → enables S3 native locking  
🔹 S3 **versioning must be enabled**

---

## How to Test Locking
Open two terminals:

| Terminal 1 | Terminal 2 |
|-----------|------------|
| `terraform apply` | `terraform plan` or `terraform apply` |

Expected error in Terminal 2:
```
Error: Error acquiring the state lock
operation error S3: PutObject, StatusCode: 412
```

👉 You will see a temporary `.tflock` file in S3 during operation.

---

## Backend Migration
```sh
terraform init
```
Terraform will detect backend changes → type **yes** to migrate state.

Verify remote state:
```sh
terraform state list
```

---

## State Commands
| Command | Purpose |
|---------|---------|
| `terraform state list` | List resources in state |
| `terraform state show <resource>` | Show detailed info |
| `terraform state rm <resource>` | Remove resource from state without destroying |
| `terraform state mv <src> <dest>` | Move resource between modules |
| `terraform state pull` | Download displayed state |

---

## Security Considerations
- Restrict S3 access using IAM Policies
- Enable **S3 versioning** & **SSE encryption**
- Enable **CloudTrail and access logs**
- Grant minimal IAM permissions
- Never store state without encryption

---

## Common Issues
| Issue | Fix |
|-------|-----|
| Lock stuck | Delete `.tflock` file or run `terraform force-unlock <lock-id>` |
| Permission denied | Update IAM policy |
| Versioning disabled | Enable S3 bucket versioning |
| Region mismatch | Use same region across backend & provider |
| Name conflict | S3 bucket names must be globally unique |
| Running old Terraform | Requires **Terraform 1.10+** |

---

### 🚀 End of Day 4 — Remote Backend & State Management
