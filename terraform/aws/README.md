# AWS Terraform Starter

This directory is the root deployment entrypoint for the AWS infrastructure foundation.

## Included

- VPC with public and private subnets
- Internet gateway and NAT gateway
- EKS cluster
- Managed node group
- Secure defaults for tags and environment metadata

## Usage

```bash
cd terraform/aws
terraform init
terraform plan
terraform apply
```

## Notes

This is a starter layout intended for enterprise standards and should be extended with additional modules for security, networking, and monitoring.
