# Getting Started

This guide is intended for engineers, platform teams, and operators who want to use this repository as a reusable infrastructure foundation.

## What this repository provides

This project is a multi-cloud infrastructure accelerator for:
- Terraform-based provisioning
- Kubernetes deployment patterns
- CI/CD automation
- security and compliance policy validation
- enterprise-ready starter architecture

It is designed to be used as a baseline for deploying secure cloud environments with a reproducible structure.

## Prerequisites

Before using this repo, make sure you have:

- Git installed
- a cloud account for AWS, Azure, or GCP
- Terraform 1.6 or newer
- a Kubernetes client for validation and debugging
- access to a CI/CD platform such as GitHub Actions
- role-based credentials or OIDC federation configured for cloud deployment

## Recommended local setup

1. Clone the repository
2. Open the project folder
3. Review the documents in this order:
   - README.md
   - ARCHITECTURE.md
   - SPECS.md
   - SKILLS.md
   - RULES.md
   - AGENT.md
4. Navigate to the target cloud provider folder under terraform/
5. Review the module layout and provider settings

## Quick start for AWS

```bash
cd terraform/aws
terraform init
terraform plan
terraform apply
```

## Important notes

- Do not commit secrets or credentials.
- Use environment variables or secure secret stores for cloud access.
- Use the approved module structure instead of creating ad hoc resources.
- Run validation and scanning checks before applying infra changes.

## Standard validation checklist

Run these before closing or merging changes:

```bash
terraform fmt -recursive
terraform validate
terraform plan
```

Security scanning:

```bash
tfsec terraform
checkov -d terraform
trivy fs .
```

## Repository conventions

- Terraform modules live under terraform/modules
- Provider-specific root stacks live under terraform/aws, terraform/azure, terraform/gcp
- Kubernetes manifests live under kubernetes/
- CI/CD definitions live under pipelines/
- Security policy config lives under policies/

## Handoff expectations

When sharing this repo with other users:
- store cloud credentials in secure secret manager or cloud identity
- document provider assumptions clearly
- keep module boundaries clean and reusable
- validate all infrastructure changes in CI
- keep architecture and runbooks aligned with the code

## Support model

This is a starter foundation and should be treated as a base for internal standards, not a one-size-fits-all production deployment. Teams should tailor module parameters, naming conventions, and controls to their own compliance and operating requirements.
