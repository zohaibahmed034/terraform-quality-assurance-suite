
# Terraform Testing and Quality Assurance Lab

## Overview

This project demonstrates how to implement **Testing and Quality Assurance for Terraform Infrastructure as Code (IaC)**.
The lab focuses on using industry-standard tools to validate Terraform configurations, detect security vulnerabilities, and enforce best practices before deploying infrastructure.

The workflow integrates multiple tools to ensure **secure, reliable, and production-ready Terraform code**.

---

# Objectives

The goal of this lab is to learn how to implement a **quality assurance pipeline for Terraform projects**.

After completing this lab you will be able to:

* Install and configure **tflint** for Terraform linting
* Use **tfsec** to scan Terraform code for security vulnerabilities
* Run **terraform validate** to check syntax and configuration correctness
* Implement an automated **Infrastructure as Code QA workflow**
* Generate reports for Terraform code quality and security analysis
* Integrate Terraform testing tools into DevOps pipelines

---

# Prerequisites

Before running this project you should have:

* Basic knowledge of **Terraform**
* Familiarity with **Linux command line**
* Understanding of **Infrastructure as Code (IaC)**
* Basic cloud security concepts
* Linux package management experience

---

# Tools Used

| Tool       | Purpose                             |
| ---------- | ----------------------------------- |
| Terraform  | Infrastructure as Code provisioning |
| tflint     | Terraform linter for best practices |
| tfsec      | Security scanner for Terraform      |
| pre-commit | Git hooks for automated checks      |
| Bash       | Automation scripts                  |

---

# Project Structure

```
terraform-qa-lab
│
├── main.tf
├── security-issues.tf
├── syntax-errors.tf
├── .tflint.hcl
├── validate-all.sh
├── quality-gate.sh
├── generate-reports.sh
├── qa-reports/
│
└── README.md
```

---

# Installation

Update system packages

```
sudo apt update
sudo apt install -y curl unzip wget python3-pip
```

---

# Install Terraform

```
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update
sudo apt install terraform
```

Verify installation

```
terraform version
```

---

# Install tflint

```
curl -s https://api.github.com/repos/terraform-linters/tflint/releases/latest \
| grep browser_download_url \
| grep linux_amd64.zip \
| cut -d '"' -f 4 \
| wget -qi -

unzip tflint_linux_amd64.zip
sudo mv tflint /usr/local/bin/
sudo chmod +x /usr/local/bin/tflint
```

Verify installation

```
tflint --version
```

---

# Install tfsec

```
curl -s https://api.github.com/repos/aquasecurity/tfsec/releases/latest \
| grep browser_download_url \
| grep linux-amd64 \
| cut -d '"' -f 4 \
| wget -qi -

chmod +x tfsec-linux-amd64
sudo mv tfsec-linux-amd64 /usr/local/bin/tfsec
```

Verify installation

```
tfsec --version
```

---

# Terraform Initialization

Initialize the working directory

```
terraform init
```

Validate Terraform configuration

```
terraform validate
```

---

# Running Terraform QA Tools

## Run Terraform Linter

```
tflint
```

Generate lint report

```
tflint --format=json > tflint-report.json
```

---

## Run Security Scan

```
tfsec .
```

Generate HTML security report

```
tfsec --format=html . > tfsec-report.html
```

---

# Automation Scripts

### Run Complete QA Check

```
./validate-all.sh
```

This script runs:

* terraform fmt
* terraform validate
* tflint analysis
* tfsec security scan

---

### Run Quality Gate

```
./quality-gate.sh
```

This script ensures:

* Terraform code formatting
* Syntax validation
* Linting checks
* Security scanning

If any critical check fails, deployment should stop.

---

### Generate Reports

```
./generate-reports.sh
```

Reports generated:

* tflint-report.json
* tfsec-report.json
* tfsec-report.html
* terraform-validate.json
* summary.md

All reports are saved in:

```
qa-reports/
```

---

# Security Issues Tested in This Lab

The project intentionally includes security misconfigurations such as:

* Public security group rules
* Hardcoded credentials
* Unencrypted storage
* Public S3 bucket access
* Overly permissive IAM policies

These issues help demonstrate how **tfsec detects real-world cloud security risks.**

---

# DevSecOps Workflow

This lab demonstrates a **DevSecOps pipeline** for Terraform.

```
Developer → Code Commit
       ↓
Pre-Commit Hooks
       ↓
tflint (Best Practices)
       ↓
Terraform Validate
       ↓
tfsec Security Scan
       ↓
Quality Gate
       ↓
Deployment
```

---

# Key Learning Outcomes

* Infrastructure testing automation
* Terraform linting best practices
* Cloud security scanning
* DevSecOps pipeline integration
* Quality gates for infrastructure code

---

# Author

**Zohaib Ahmed**

DevOps Engineer | Terraform | Kubernetes | Cloud Infrastructure

---

# License

This project is created for **DevOps Project purposes.**
