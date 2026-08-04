# Release Process

This repository should follow a simple, auditable release process for infrastructure changes.

## Release principles

- Changes must be reviewed and validated before shipping
- Security and compliance checks must be completed
- Deployment should be traceable back to a versioned commit
- Production changes should be intentional and minimal

## Standard release flow

1. Create a feature or fix branch
2. Make the required code and documentation updates
3. Run validation and policy checks
4. Open a pull request
5. Obtain review approval
6. Merge to main
7. Run the CI pipeline
8. Tag the release if using versioned artifacts
9. Deploy to the target environment

## Required checks before release

- Terraform formatting and validation
- Terraform plan review
- tfsec scan
- Checkov scan
- Trivy scan
- manual review of any security exceptions

## Versioning

Use semantic versioning for released platform artifacts when practical:
- Major: breaking architecture changes
- Minor: new capabilities or modules
- Patch: fixes and documentation updates

## Production rollout guidance

For production environments:
- prefer staged promotion
- validate the plan in a non-production environment first
- maintain rollback instructions
- record deployment notes and change justification

## Rollback expectation

Every deployment should have a documented rollback path. For infrastructure changes, this may include:
- reverting the Terraform change set
- reapplying prior state
- removing or disabling affected resources
- confirming service health and logs after rollback

## Documentation requirement

Each release should include:
- summary of changes
- impacted systems
- validation performed
- rollback guidance
- any risks or pending follow-ups
