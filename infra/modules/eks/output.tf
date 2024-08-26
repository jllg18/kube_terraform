# outputs.tf

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List of public subnet IDs"
  value       = module.subnets.public_subnets
}

output "private_subnets" {
  description = "List of private subnet IDs"
  value       = module.subnets.private_subnets
}

output "eks_cluster_id" {
  description = "EKS Cluster ID"
  value       = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  description = "EKS Cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_security_group_id" {
  description = "Security group ID attached to the EKS cluster"
  value       = module.eks.cluster_security_group_id
}

output "eks_managed_node_group_arns" {
  description = "List of ARNs for the managed node groups"
  value       = module.eks.eks_managed_node_group_arns
}