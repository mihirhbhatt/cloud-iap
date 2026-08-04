# Cloud Setup Guide

This document explains how to configure the repository for AWS, Azure, or GCP using GitHub OIDC.

## General pattern

Each cloud provider requires:
- GitHub OIDC identity federation
- a cloud role or service principal with the right trust relationship
- GitHub repository or environment variables
- provider-specific Terraform configuration and validation

## AWS setup

### Prerequisites
- an AWS account
- IAM permissions to create an OIDC provider and role
- a GitHub repository

### Steps

1. Create an OIDC provider for GitHub if it does not exist:

```bash
aws iam create-open-id-connect-provider \
  --url https://token.actions.githubusercontent.com \
  --thumbprint 6938fd4d98bab03faadb97c3bb9... \
  --client-id-list sts.amazonaws.com
```

2. Create an IAM role for GitHub Actions.
3. Add a trust policy matching your repository and branch:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::<ACCOUNT_ID>:oidc-provider/token.actions.githubusercontent.com"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "token.actions.githubusercontent.com:aud": "sts.amazonaws.com",
          "token.actions.githubusercontent.com:sub": "repo:<OWNER>/<REPO>:ref:refs/heads/main"
        }
      }
    }
  ]
}
```

4. Attach least-privilege permissions for Terraform.
5. Add GitHub variables:
   - `AWS_REGION`
   - `AWS_ROLE_ARN`

## Azure setup

### Prerequisites
- Azure subscription
- Entra ID access
- GitHub repository

### Steps

1. Register an app in Microsoft Entra ID.
2. Add a federated credential for GitHub:
   - issuer: `https://token.actions.githubusercontent.com`
   - subject: `repo:<OWNER>/<REPO>:ref:refs/heads/main`
3. Grant the application the required role assignments for Terraform.
4. Add GitHub variables:
   - `AZURE_CLIENT_ID`
   - `AZURE_TENANT_ID`
   - `AZURE_SUBSCRIPTION_ID`

## GCP setup

### Prerequisites
- GCP project
- Workload Identity Federation enabled
- service account to impersonate

### Steps

1. Create a Workload Identity Pool for GitHub Actions.
2. Add a provider for `token.actions.githubusercontent.com`.
3. Map the provider to a GCP service account.
4. Set the subject to match the repository and branch.
5. Add GitHub variables:
   - `GCP_WORKLOAD_IDENTITY_PROVIDER`
   - `GCP_SERVICE_ACCOUNT_EMAIL`

## Common validation

After setup, validate with:

```bash
terraform fmt -recursive
terraform validate
terraform plan
```

## Security notes

- Use the least privilege required for the pipeline.
- Avoid static cloud keys.
- Use OIDC or equivalent federated identity wherever possible.
- Keep permissions scoped by environment and repository.
