output "vpc_id" {
  description = "The VPC ID for the environment"
  value       = module.networking.vpc_id
}

output "private_subnet_ids" {
  description = "Private subnet IDs used by the EKS cluster"
  value       = module.networking.private_subnet_ids
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.networking.public_subnet_ids
}

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS API endpoint"
  value       = module.eks.cluster_endpoint
}
