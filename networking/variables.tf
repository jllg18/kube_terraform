variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "EksVPC"
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "11.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["11.0.1.0/24", "11.0.2.0/24", "11.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["11.0.4.0/24", "11.0.5.0/24", "11.0.6.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket to store the Terraform state."
  type        = string
  default     = "disrupting-terraform-state-bucket-ado"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table to store the Terraform locks."
  type        = string
  default     = "terraform-lock"
}

variable "region" {
  description = "The AWS region to use for the resources."
  type        = string
  default     = "us-east-1"
}