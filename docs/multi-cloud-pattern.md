# Multi-Cloud GitHub Actions Pattern

This repository is structured to support a cloud-agnostic delivery model while keeping each provider's identity setup isolated.

## Recommended pattern

Use one workflow per cloud provider:

- .github/workflows/terraform-aws.yml
- .github/workflows/terraform-azure.yml
- .github/workflows/terraform-gcp.yml

This keeps the deployment logic clean and prevents one provider's auth model from leaking into another provider's workflow.

## Provider-specific variables

Set the following GitHub repository or environment variables depending on the provider:

### AWS
- `AWS_REGION`
- `AWS_ROLE_ARN`

### Azure
- `AZURE_CLIENT_ID`
- `AZURE_TENANT_ID`
- `AZURE_SUBSCRIPTION_ID`

### GCP
- `GCP_WORKLOAD_IDENTITY_PROVIDER`
- `GCP_SERVICE_ACCOUNT_EMAIL`

## Why this is cloud agnostic

The repository remains cloud-agnostic because:
- infrastructure code is separated by provider under terraform/
- each provider has its own workflow and auth method
- shared standards remain in README, SKILLS, RULES, and SPECS
- the repo is designed around modular patterns instead of a single cloud implementation

## Example operating model

A team can choose one of the following modes:

1. AWS-only deployment
2. Azure-only deployment
3. GCP-only deployment
4. multiple cloud deployments via separate CI jobs or repository environments

## Recommended governance

- one identity per cloud provider
- separate GitHub environments for dev, stage, and prod
- secure and explicit OIDC trust policies
- validation and security scans before deployment

## Implementation guidance

- Keep Terraform code under provider-specific folders
- keep shared standards under docs and top-level repo files
- isolate cloud auth in each pipeline file
- do not mix AWS, Azure, and GCP authentication flows in one workflow
