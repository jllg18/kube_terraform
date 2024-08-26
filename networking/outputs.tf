output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = module.subnets.private_subnet_ids # Reference the module output, not the resource directly
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.subnets.public_subnet_ids # Reference the module output, not the resource directly
}
