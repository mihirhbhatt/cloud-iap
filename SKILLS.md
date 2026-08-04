# Enterprise Skills Library

This repository follows enterprise cloud engineering standards.

---

# Terraform

## Always

- Use reusable modules
- Use remote state
- Pin provider versions
- Run terraform fmt
- Run terraform validate
- Run terraform plan
- Use outputs.tf
- Use variables.tf

## Never

- Hardcode credentials
- Hardcode regions
- Duplicate modules
- Use inline IAM policies unless justified

---

# AWS

Networking

- Multi-AZ
- Private Subnets
- NAT Gateway
- VPC Flow Logs

Security

- IAM Roles
- KMS Encryption
- Secrets Manager
- CloudTrail
- GuardDuty

Storage

- Block Public Access
- Versioning
- Lifecycle Rules

Monitoring

- CloudWatch
- AWS Config

---

# Azure

Networking

- Hub-Spoke
- Private Endpoints
- NSG
- Azure Firewall

Security

- Managed Identity
- Azure Policy
- Defender for Cloud
- Key Vault

Monitoring

- Azure Monitor
- Log Analytics

---

# Google Cloud

Networking

- Shared VPC
- Private Service Connect

Security

- IAM Least Privilege
- Cloud KMS
- Secret Manager

Monitoring

- Cloud Monitoring
- Cloud Logging

---

# Kubernetes

Always

- Liveness probes
- Readiness probes
- Resource requests
- Resource limits
- Network Policies

Never

- latest image tag
- privileged containers

---

# GitHub Actions

Always

- OIDC Authentication
- Artifact Upload
- Matrix Builds
- Dependency Cache

Never

- Store Cloud Keys
- Hardcode Secrets

---

# Security

Always

- Least Privilege
- Encryption
- MFA
- Logging
- CIS Benchmarks

Run

- tfsec
- Checkov
- Trivy

---

# Python

Always

- Black
- Ruff
- Pytest
- Type Hints

---

# Documentation

Every feature must include

- README
- Architecture Update
- Example
- Variables
- Outputs
