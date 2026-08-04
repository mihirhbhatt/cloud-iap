# Terraform Modules

This directory contains reusable infrastructure modules for shared platform building blocks.

## Included module groups

- aws/
- azure/
- gcp/
- networking/
- security/
- monitoring/
- kubernetes/

## Module conventions

Each module should include:
- main.tf
- variables.tf
- outputs.tf
- README.md when practical

## Design principles

- keep modules focused and reusable
- document required variables and outputs
- use naming consistent with the environment and project
- avoid embedding secrets in configuration
- prefer versioned, reviewed implementations

## Example

```bash
module "networking" {
  source = "./modules/aws/networking"

  project_name = "cloud-iap"
  environment  = "dev"
  vpc_cidr     = "10.0.0.0/16"
}
```
