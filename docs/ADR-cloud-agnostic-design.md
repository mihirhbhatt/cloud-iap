# ADR: Cloud-Agnostic Infrastructure Design

## Status
Accepted

## Context

The repository is intended to support multiple cloud providers without locking the team into a single platform. Users may deploy to AWS, Azure, or GCP depending on workload requirements, security posture, and operating model.

## Decision

We will structure the codebase around provider-specific Terraform roots and shared platform standards instead of embedding one cloud implementation into the repository defaults.

The project uses:
- provider-specific folders under terraform/
- shared governance files at the repo root
- provider-specific GitHub OIDC workflows
- a common enterprise operating model for security, validation, and documentation

## Consequences

### Benefits
- reuse of common standards across providers
- easier onboarding for teams with different cloud choices
- safer auth model because each provider has its own OIDC flow
- cleaner separation of responsibilities between shared repo rules and provider implementation

### Trade-offs
- more setup work per cloud provider
- separate identity configuration per environment
- provider-specific validation and execution paths

## Implementation guidance

Each provider should include:
- Terraform root folder
- environment variables or tfvars files
- cloud-specific backend config
- dedicated CI pipeline

## Governance

All infrastructure changes must satisfy the repository standards for:
- least privilege
- encryption
- monitoring
- validation
- documentation

The repository remains cloud-agnostic at the architecture level, while the actual cloud authentication and infrastructure remain provider-specific.
