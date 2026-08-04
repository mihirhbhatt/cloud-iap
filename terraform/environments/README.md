# Environment Configurations

This directory contains example environment-specific variable files for common deployment tiers.

## Structure

- dev/terraform.tfvars — development defaults
- stage/terraform.tfvars — pre-production validation settings
- prod/terraform.tfvars — production settings

## Usage

```bash
cd terraform/aws
terraform init -backend-config=../backends/aws-s3-dynamodb.hcl
terraform plan -var-file=../environments/dev/terraform.tfvars
```

## Notes

- Use a dedicated backend and lock table per environment
- Keep production values reviewed and approved
- Never commit real secret material
