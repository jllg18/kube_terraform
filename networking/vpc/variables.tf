variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default = "EksVPC"
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "11.0.0.0/16"
}

