module "backend" {
  source = "./backend"

  s3_bucket_name      = var.s3_bucket_name
  dynamodb_table_name = var.dynamodb_table_name
  region              = var.region
}

module "vpc" {
  source = "./vpc"

  vpc_name   = var.vpc_name
  cidr_block = var.cidr_block
}

module "subnets" {
  source = "./subnets"

  vpc_id               = module.vpc.vpc_id
  vpc_name             = var.vpc_name
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

module "internet_gateway" {
  source = "./internet_gateway"

  vpc_id   = module.vpc.vpc_id
  vpc_name = var.vpc_name
}

module "nat_gateway" {
  source            = "./nat_gateway"
  vpc_name          = var.vpc_name
  public_subnet_ids = module.subnets.public_subnet_ids # Pass all public subnets
}

module "route_tables" {
  source = "./route_tables"

  vpc_id          = module.vpc.vpc_id
  public_subnets  = module.subnets.public_subnet_ids  # Reference the output from the subnets module
  private_subnets = module.subnets.private_subnet_ids # Reference the output from the subnets module
  igw_id          = module.internet_gateway.igw_id
  nat_gateway_ids = module.nat_gateway.nat_gateway_ids
  vpc_name        = var.vpc_name
}
