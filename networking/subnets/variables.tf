variable "vpc_id" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["11.0.1.0/24", "11.0.2.0/24", "11.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["11.0.4.0/24", "11.0.5.0/24", "11.0.6.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
