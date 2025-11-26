# 🚀 Day 3 of My Cloud Learning Journey — Creating an S3 Bucket with Terraform

Today was a very special day in my cloud learning path.  
For the first time, I created a real **AWS S3 bucket using Terraform** — and it worked successfully.  
This small achievement boosted my confidence in Infrastructure as Code.

---

## 🔐 Step 1 — Authentication to AWS
Before creating any cloud resource, Terraform must authenticate (log in) to AWS.

To do that, I set my AWS credentials using:

```
aws configure
```

I entered:
- AWS Access Key ID  
- AWS Secret Access Key  
- Default AWS region  

After this step, Terraform got permission to access my AWS account and create resources.

---

## 🪣 Learning About S3
AWS S3 (Simple Storage Service) is a popular cloud storage service.  
Companies use S3 for storing:

- Images  
- Documents  
- Videos  
- Backups  
- Logs and big datasets  

I also learned an important rule:  
➡️ **S3 bucket names must be unique across the entire world**.

So if someone has already used a name, you must use a different one.

---

## 🧪 Creating the S3 Bucket Using Terraform
Once my Terraform configuration file was ready, I executed these commands:

```
terraform init
terraform plan
terraform apply
```

Within seconds, the S3 bucket was created successfully.  
I logged in to the AWS Management Console and saw the bucket there.  
That moment gave me real confidence — **I created cloud infrastructure using code**.

---

## 🧹 Cleanup — A Good Habit
After testing, I deleted the S3 bucket to avoid unnecessary AWS charges:

```
terraform destroy
```

Learning to clean up resources is part of becoming a good cloud engineer.

---

## 📌 What I Learned Today
| Topic | Learning |
|-------|----------|
| Authentication | Terraform needs valid AWS credentials |
| S3 storage | Used for storing and managing data |
| Bucket name rules | Must be globally unique |
| Terraform usage | init → plan → apply → destroy |
| Cloud cost | Always delete unused resources |

---

## 🌱 Final Thoughts
Day 3 taught me more than just S3 bucket creation.  
It showed how **automation, security, and responsibility** work together in cloud engineering.

I am excited and motivated to keep going.  
Step by step, I am getting closer to becoming a cloud and DevOps professional. 🚀

---

If you are also learning AWS or Terraform, feel free to follow and connect.  
Let’s grow and learn together. 💪
