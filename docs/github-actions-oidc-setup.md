# GitHub Actions OIDC Setup for Other Users

This repository is designed to be portable. The workflow does not hardcode a single AWS account or role ARN so another user can reuse the same project with their own AWS environment.

## Required GitHub repository variables

Set the following repository or environment variables in GitHub:

- `AWS_REGION` = e.g. `us-east-1`
- `AWS_ROLE_ARN` = e.g. `arn:aws:iam::123456789012:role/cloud-iap-github-actions`

## Required AWS trust policy

The AWS role used in `AWS_ROLE_ARN` must trust GitHub OIDC with a subject matching the repository name and branch.

Example:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::123456789012:oidc-provider/token.actions.githubusercontent.com"
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

Replace:
- `<OWNER>` with the GitHub org or user name
- `<REPO>` with the repository name

## Example for this repo

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::123456789012:oidc-provider/token.actions.githubusercontent.com"
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

## Why this is portable

The code now reads credentials from GitHub repository variables instead of embedding one specific AWS account or role value. That means another team can clone or reuse the repo and define their own `AWS_ROLE_ARN` and `AWS_REGION` to match their environment.

## Important warning

The repo still requires the target AWS role and OIDC trust policy to be configured correctly in the destination AWS account. The workflow itself is reusable, but the AWS identity setup is environment-specific.
