provider "aws" {
  region = var.region
}

module "vpc" {
  source = "../../modules/vpc"
  vpc_name            = var.vpc_name
  cidr_block          = var.cidr_block

}

module "subnets" {
  source = "../../modules/subnets"
  vpc_id = module.vpc.vpc_id
  vpc_name = module.vpc.vpc_name

}

module "eks" {
  source = "./eks"

  cluster_name       = var.cluster_name
  cluster_version    = var.cluster_version
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  node_group_name    = var.node_group_name
  instance_types     = var.instance_types
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
}