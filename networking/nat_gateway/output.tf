output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs"
  value       = aws_nat_gateway.nat_gw[*].id  # Output the list of NAT Gateway IDs
}



