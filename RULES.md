# Security and Compliance Guardrails

This repository enforces enterprise guardrails for infrastructure delivery.

## Mandatory Rules

### Identity and Access
- Use least-privilege IAM or equivalent role permissions
- Prefer federated identity and OIDC authentication for CI/CD
- Enforce MFA for human access
- Do not provision long-lived cloud credentials in repositories

### Secrets and Data Protection
- Store secrets in managed secret stores only
- Encrypt data at rest and in transit by default
- Use KMS or equivalent managed encryption keys
- Do not hardcode region, credentials, or sensitive values

### Network Security
- Keep services private unless public access is explicitly required
- Use segmentation, private endpoints, and firewall controls
- Restrict inbound and outbound access to known sources
- Enable logging and diagnostics for network flows

### Compliance and Governance
- Follow CIS benchmark expectations where applicable
- Maintain audit logs for infrastructure and access changes
- Require code review and policy checks before deployment
- Enforce configuration drift detection and remediation

### Platform Standards
- Use Terraform remote state
- Pin provider versions
- Keep modules reusable and centralized
- Do not duplicate infrastructure patterns across modules
- Use explicit variables and outputs for every module

## Forbidden Practices

- Hardcoded credentials
- Inline IAM policies used without justification
- Latest image tags in production
- Privileged containers without approval
- Public access to internal resources without documented necessity
- Storing cloud keys in GitHub Actions secrets or source files

## Required Validation

Run these checks before sign-off:
- terraform fmt
- terraform validate
- terraform plan
- tfsec
- Checkov
- Trivy

## Security Review Standard

The implementation must demonstrate:
- least privilege
- encryption
- logging
- segmentation
- policy enforcement
- safe deployment automation

## Policy Outcome

Any infrastructure change that weakens security, bypasses logging, exposes secrets, or ignores compliance requirements must be rejected or remediated before merge.
