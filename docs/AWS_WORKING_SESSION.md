# AWS Working Session Guide

This guide is for using this repository with your own AWS account.

## What you need

- an AWS account with permission to create IAM roles and OIDC provider
- GitHub repository access
- AWS CLI installed locally
- Terraform installed locally if you want to validate outside GitHub Actions

## 1. Verify AWS access locally

Run:

```bash
aws sts get-caller-identity
```

If this works, your AWS CLI is configured correctly.

If not, configure it:

```bash
aws configure
```

Or use an AWS profile:

```bash
export AWS_PROFILE=your-profile
aws sts get-caller-identity
```

## 2. Create the GitHub OIDC provider in AWS

In AWS IAM, create an identity provider for GitHub:

- Provider URL: `https://token.actions.githubusercontent.com`
- Audience: `sts.amazonaws.com`
- Thumbprint: use the current GitHub OIDC thumbprint published by GitHub / AWS docs

You can also do this with AWS CLI:

```bash
aws iam create-open-id-connect-provider \
  --url https://token.actions.githubusercontent.com \
  --thumbprint-list "<CURRENT_GITHUB_OIDC_THUMBPRINT>" \
  --client-id-list sts.amazonaws.com
```

> If the provider already exists, do not create it again.

## 3. Create the IAM role for GitHub Actions

Create a role named `cloud-iap-github-actions`.

Trust policy example:

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
          "token.actions.githubusercontent.com:sub": "repo:mihirhbhatt/cloud-iap:ref:refs/heads/main"
        }
      }
    }
  ]
}
```

Replace:
- `<ACCOUNT_ID>` with your AWS account ID
- `mihirhbhatt` with your GitHub user/org if different
- `cloud-iap` with your repo name if different

## 4. Attach permissions

For a demo or starter deployment, attach a policy with Terraform access. For a safer enterprise setup, use least privilege.

Example for a demo:

```bash
aws iam attach-role-policy \
  --role-name cloud-iap-github-actions \
  --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
```

> For real use, replace `AdministratorAccess` with a more limited IAM policy.

## 5. Add GitHub repository variables

Go to GitHub:

- Repository -> Settings -> Secrets and variables -> Actions -> Variables

Add these variables:

- `AWS_REGION` = `us-east-1`
- `AWS_ROLE_ARN` = `arn:aws:iam::<ACCOUNT_ID>:role/cloud-iap-github-actions`

These values are used by the workflow in `.github/workflows/terraform-aws.yml`.

## 6. Use the AWS workflow

The repository already includes the AWS workflow at:

- `.github/workflows/terraform-aws.yml`

It will:
- authenticate to AWS with GitHub OIDC
- run Terraform init
- run Terraform validate
- run Terraform plan
- run security checks with tfsec and Checkov

## 7. Local validation (optional)

If you want to run locally:

```bash
cd terraform/aws
terraform init
terraform plan
```

You will need:
- AWS credentials configured locally
- permissions for the resources in the Terraform config

## 8. Demo flow for a real AWS session

A clean demo flow is:

1. Explain the business need
2. Show the architecture diagram in the README
3. Open the AWS GitHub workflow
4. Explain that GitHub uses OIDC to get temporary AWS credentials
5. Show the repo variables in GitHub
6. Explain that the pipeline validates and plans before deployment
7. Show the Terraform folder and environment values

## 9. Key security reminder

- Do not store AWS keys in GitHub repo secrets
- Use OIDC instead of static credentials
- Keep the IAM role scoped to the minimum required access
- Use separate roles for dev/stage/prod if you want production-level separation

## 10. What to do next

If you want a working AWS-first demo, the fastest path is:

1. Create the IAM role and OIDC provider
2. Add `AWS_ROLE_ARN` and `AWS_REGION` to GitHub repo variables
3. Push a change to the main branch
4. Watch the GitHub Actions workflow run
5. Fix any IAM trust mismatch if the role is not accepted
