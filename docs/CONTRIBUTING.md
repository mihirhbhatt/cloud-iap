# Contributing Guide

Thank you for contributing to Cloud IAP.

This project is intended to be a secure, reusable, enterprise-ready cloud infrastructure starter. Contributions should follow the repository standards and preserve the quality bar for production use.

## Contribution principles

- Prefer reusable modules over ad hoc infrastructure
- Keep changes auditable and easy to review
- Avoid hardcoded secrets or environment-specific values
- Document public variables and outputs clearly
- Validate changes before submitting a pull request

## Local setup

1. Clone the repository
2. Ensure you have the required tooling installed:
   - Git
   - Terraform 1.6+
   - optional: tfsec, Checkov, Trivy, kubectl
3. Review the central project docs:
   - README.md
   - ARCHITECTURE.md
   - RULES.md
   - SKILLS.md

## Branching model

Use a simple branching pattern:
- main for production-ready code
- feature/* for new functionality
- fix/* for bug fixes
- chore/* for maintenance tasks

## Pull request expectations

Every pull request should include:
- a concise summary of the change
- affected components and files
- validation steps that were run
- security or compliance considerations
- any assumptions or follow-up actions

## Required validation

Before opening a PR, run:

```bash
terraform fmt -recursive
terraform validate
terraform plan
```

Also run policy checks where appropriate:

```bash
tfsec terraform
checkov -d terraform
trivy fs .
```

## Coding standards

- Prefer explicit variables and outputs
- Keep modules focused and reusable
- Add README guidance for major components
- Use descriptive naming that reflects environment and purpose
- Pin provider versions and avoid unbounded upgrades

## Security requirements

- Never commit credentials, tokens, or secret values
- Use environment variables or managed secret stores
- Prefer OIDC-based cloud auth in CI/CD
- Document any exceptions to secure defaults

## Documentation expectations

Changes that affect infrastructure behavior should include:
- README or module-level docs
- architecture notes when relevant
- example usage or deployment notes
- parameter and output documentation

## Review checklist

Before merge, confirm:
- code is readable and maintainable
- security rules are still satisfied
- no accidental drift or duplicate modules were introduced
- examples remain valid
- CI validation has passed

## Release note guidance

When preparing a release, highlight:
- new architecture elements
- security changes
- provider or version updates
- migration notes
- validation performed
