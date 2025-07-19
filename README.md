# Secure Web App Deployment on AWS using Terraform

This repository contains Terraform configurations for securely deploying a web application on AWS. It follows modular infrastructure-as-code best practices, enabling you to provision, manage, and scale your cloud resources in a reliable and repeatable way.

---
## Infrastructure Overview
<img width="1005" height="551" alt="image" src="https://github.com/user-attachments/assets/e4c295ea-5a12-4519-8b29-f0f94c1d5acf" />


## Repository Structure

```
Secure-Web-App-Deployment-on-AWS-using-Terraform/
├── project/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── modules/
│       ├── instances/           # EC2 instance definitions and provisioning
│       ├── LoadBalancer/        # AWS Load Balancer configuration
│       ├── network/
│       │   └── vpc/             # VPC setup and subnets
│       └── secuirtyGroup/       # Security Group rules
├── remoteBackend/
│   └── ...                      # Remote state backend configuration (e.g., S3, DynamoDB)
```

**Key Folders:**
- `project/`: Main entry point for your Terraform infrastructure. Includes root configuration files and the modules directory.
- `project/modules/`: Contains reusable modules for AWS resources.  
  - `network/vpc/`: VPC and subnet configuration.
  - `instances/`: EC2 instance settings.
  - `LoadBalancer/`: Load balancer setup.
  - `secuirtyGroup/`: Security group rules for access control.
- `remoteBackend/`: Configurations for storing Terraform state remotely for team collaboration and state locking.

---

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.x
- AWS credentials configured (via environment variables or AWS CLI)
- Access to an AWS account with permissions to create resources

---

## Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/MostafaMahmoud2020/Secure-Web-App-Deployment-on-AWS-using-Terraform.git
   cd Secure-Web-App-Deployment-on-AWS-using-Terraform/project
   ```

2. **Configure the remote backend**
   - Edit the backend configuration files in `../remoteBackend/` to point to your S3 bucket (and optionally DynamoDB table for state locking).

3. **Initialize Terraform**
   ```bash
   terraform init
   ```

4. **Customize Variables**
   - Adjust values in `variables.tf` to fit your AWS environment (region, instance types, CIDR blocks, etc.).

5. **Plan and Apply**
   ```bash
   terraform plan
   terraform apply
   ```
   - Review the proposed changes and confirm to provision the infrastructure.

---

## Module Overview

- **network/vpc**: Provisions a custom VPC with public/private subnets.
- **instances**: Launches EC2 instances for your web application.
- **LoadBalancer**: Sets up an AWS Elastic Load Balancer for high availability.
- **secuirtyGroup**: Manages security groups to restrict/allow network traffic as needed.

---

## Security Best Practices

- Store sensitive variables securely (do not commit secrets).
- Restrict inbound/outbound traffic with strict security group rules.
- Use remote backend with state locking to prevent concurrent changes.
- Regularly review IAM policies and least privilege access.

---

## Contributing

Contributions, issues, and feature requests are welcome!  
Feel free to open an issue or submit a pull request.

---

## License

This project is licensed under the MIT License.

---

**Author:** [MostafaMahmoud2020](https://github.com/MostafaMahmoud2020)
