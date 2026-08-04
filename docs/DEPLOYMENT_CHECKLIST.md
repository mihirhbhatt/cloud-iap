# Deployment Checklist

Use this checklist before shipping infrastructure changes to another team or environment.

## Pre-flight

- [ ] Repository has been reviewed for secrets or credentials
- [ ] Terraform variables have been reviewed and documented
- [ ] Provider version constraints are pinned
- [ ] Remote state strategy is defined
- [ ] Cloud identity or OIDC access is configured

## Network and security

- [ ] VPC or equivalent network boundary is defined
- [ ] Private subnets and segmentation are configured
- [ ] NAT or egress rules are set appropriately
- [ ] Firewall or security group rules are reviewed
- [ ] Encryption is enabled for storage and secrets
- [ ] Logging and audit traces are enabled

## Kubernetes

- [ ] namespace exists
- [ ] resource requests and limits are set
- [ ] readiness and liveness probes are configured
- [ ] image tags are explicit and not latest
- [ ] network policies are considered for service isolation

## CI/CD

- [ ] GitHub Actions or pipeline is configured
- [ ] OIDC/authentication is used instead of static keys
- [ ] plan and validation steps are included
- [ ] security scanners run in CI
- [ ] deployment is gated on quality checks

## Validation

- [ ] terraform fmt passes
- [ ] terraform validate passes
- [ ] terraform plan is reviewed
- [ ] tfsec passes or known exceptions are documented
- [ ] Checkov passes or exceptions are approved
- [ ] Trivy scan completes successfully

## Handoff

- [ ] README is understandable for new users
- [ ] architecture assumptions are clear
- [ ] examples are present and tested
- [ ] required access and environment variables are documented
- [ ] team owners are identified
