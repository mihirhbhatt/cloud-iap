# Cloud IAP

Infrastructure as Prompt for secure, repeatable multi-cloud platform delivery.

This repository is designed to turn natural-language infrastructure requests into compliant, production-ready platform artifacts. It combines Terraform, Kubernetes, GitHub Actions, and policy-as-code guardrails into a single workflow for enterprise delivery.

## Mission

Create infrastructure by prompt, not by manual drift.

The repository is structured to support:
- Request capture from human or AI workflows
- Infrastructure specification in code
- Reusable Terraform modules
- Secure cloud deployment patterns
- Policy validation and security scanning
- CI/CD automation end-to-end

## End-to-End Workflow

1. Define the workload and target cloud
2. Convert the request into a concrete infrastructure spec
3. Generate or update Terraform modules and configuration
4. Validate formatting, syntax, and plan output
5. Run policy and security checks
6. Deploy via GitHub Actions or similar pipeline
7. Monitor and iterate from observed drift, cost, and health data

## Repository Structure

- [AGENT.md](AGENT.md) — AI agent operating rules
- [SPECS.md](SPECS.md) — desired platform and workload specification
- [SKILLS.md](SKILLS.md) — enterprise engineering standards
- [RULES.md](RULES.md) — compliance and security guardrails
- [ARCHITECTURE.md](ARCHITECTURE.md) — design overview
- [terraform](terraform) — cloud Terraform code and modules
- [kubernetes](kubernetes) — cluster and app deployment manifests
- [pipelines](pipelines) — CI/CD pipeline definitions
- [policies](policies) — policy-as-code and security scanning rules
- [docs](docs) — design notes and operational guidance
- [examples](examples) — sample implementations
- [scripts](scripts) — automation helpers

## Example Prompt

"Provision a production-grade AWS EKS environment with VPC, private subnets, NAT, IAM roles, KMS encryption, CloudTrail, CloudWatch, and a secure CI/CD pipeline. Use Terraform modules, enforce least privilege, and validate with tfsec and Checkov."

## Standard Delivery Model

### 1. Foundation
- VPC or equivalent network boundary
- Private connectivity
- Shared services and observability
- Identity and access controls

### 2. Workloads
- Kubernetes cluster or managed platform
- Ingress and service exposure strategy
- Resource requests and limits
- Liveness and readiness probes

### 3. Security
- Minimal IAM permissions
- Encrypted data at rest and in transit
- Secrets handled through secure secret stores
- Audit logging enabled by default

### 4. Automation
- Terraform plan and validation in CI
- Policy checks before merge
- Deployment via OIDC-based workflows
- Artifact retention and traceability

## Quality Gates

Every change should pass:
- terraform fmt
- terraform validate
- terraform plan
- tfsec
- Checkov
- Trivy
- repo policy review

## Outcome

This repository supports Infrastructure as Prompt by converting a prompt into an auditable, reusable, policy-compliant infrastructure platform delivered through automation.
