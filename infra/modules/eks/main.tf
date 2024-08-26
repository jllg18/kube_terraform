# main.tf

# VPC Module
module "vpc" {
  source = "../../modules/vpc"

  cidr_block = var.vpc_cidr_block

}

# Subnets Module
module "subnets" {
  source = "../../modules/subnets"

  vpc_id     = module.vpc.vpc_id
  availability_zones = var.availability_zones
  cidr_block = var.subnet_cidr_blocks

  public_subnets  = var.public_subnet_cidrs
  private_subnets = var.private_subnet_cidrs

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}

# EKS Cluster Module
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.subnets.private_subnets
  control_plane_subnet_ids = module.subnets.private_subnets

  eks_managed_node_group_defaults = {
    instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
  }

  eks_managed_node_groups = {
    example = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["m5.xlarge"]

      min_size     = 2
      max_size     = 10
      desired_size = 2
    }
  }

  enable_cluster_creator_admin_permissions = true

  access_entries = {
    example = {
      kubernetes_groups = []
      principal_arn     = "arn:aws:iam::123456789012:role/something"

      policy_associations = {
        example = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
          access_scope = {
            namespaces = ["default"]
            type       = "namespace"
          }
        }
      }
    }
  }

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}