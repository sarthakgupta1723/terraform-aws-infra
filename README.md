# Terraform AWS Infrastructure (Modular & Scalable)

This repository contains a **production-ready Terraform setup** to provision AWS infrastructure using **modular design and dynamic inputs**.

The setup is suitable for **learning, interviews, and real-world deployments**.

---

## 🧱 Architecture Overview

The infrastructure provisions:

- VPC
- Multiple **Public Subnets** (Multi-AZ)
- Multiple **Private Subnets** (Multi-AZ)
- Internet Gateway (Public Subnets)
- NAT Gateway (Private Subnets)
- Security Group
- EC2 Instance (Private Subnet)
- Multiple EBS Data Disks
- Remote Backend (S3 + DynamoDB)

---

## 📁 Project Structure

```text
terraform-aws-infra-complete/
├── backend.tf
├── provider.tf
├── variables.tf
├── main.tf
├── terraform.tfvars
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── security-group/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── ec2/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

## 🔧 Prerequisites

- Terraform >= 1.3
- AWS CLI configured
- AWS account
- S3 bucket and DynamoDB table for backend

---

## 🔐 Backend Configuration

Update `backend.tf` with your details:

```hcl
bucket         = "your-terraform-state-bucket"
dynamodb_table = "terraform-lock-table"
region         = "ap-south-1"
```

---

## ⚙️ Configuration

All infrastructure values are driven by `terraform.tfvars`:

- CIDR blocks
- Availability Zones
- EC2 configuration
- EBS data disks
- Tags

---

## 🚀 Deployment Steps

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

To destroy:

```bash
terraform destroy
```

---

## 🔒 Security Notes

- EC2 runs in a **private subnet**
- Outbound internet access via **NAT Gateway**
- SSH access via Security Group (restrict as needed)

---

## 🧠 Terraform Concepts Used

- Modules
- for_each
- Maps & Lists
- Remote Backend
- Multi-AZ Design
- Resource Outputs

---

## 📈 Future Enhancements

- Application Load Balancer + Auto Scaling
- RDS in private subnet
- IAM roles & SSM
- VPC Flow Logs

---

## 👨‍💻 Author

**Sarthak Gupta**
**www.linkedin.com/in/sarthak-gupta-cloudengineer**  

---

## ⭐ Notes

This project follows **enterprise Terraform best practices** and is ideal for:

- Interview preparation
- AWS networking mastery
- Terraform modular design
