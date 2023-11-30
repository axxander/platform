# Include the root `terragrunt.hcl` configuration
include "root" {
  path   = find_in_parent_folders()
  expose = true
}

locals {
  account_name = include.root.locals.aws_account_name
  vpc_name     = "${local.account_name}-vpc"
  vpc_config   = include.root.locals.aws_networking_config[local.account_name][local.vpc_name]
}

terraform {
  source = "${get_terragrunt_dir()}/../../../../..///modules/aws/vpc"
}

inputs = {
  vpc_cidr             = local.vpc_config["cidr"]
  availability_zones   = sort(include.root.locals.aws_networking_config["availability_zones"])
  private_subnets      = [for k, v in local.vpc_config["public-subnets"] : v.cidr]
  public_subnets       = [for k, v in local.vpc_config["private-subnets"] : v.cidr]
  public_subnet_names  = [for k, v in local.vpc_config["public-subnets"] : v.name]
  private_subnet_names = [for k, v in local.vpc_config["private-subnets"] : v.name]
}
