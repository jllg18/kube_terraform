variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "igw_id" {
  type = string
}

variable "nat_gateway_ids" {
  description = "List of NAT Gateway IDs"
  type        = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

