locals {
  vpc_name = module.resource_naming.vpc_name
  tags = merge(
    var.tags,
    var.extra_tags,
    {
      service = var.service,
    }
  )
}

module "resource_naming" {
  source = "../resource-naming"

  # auto_vars
  organisation = var.organisation
  service      = var.service
  env          = var.env
  extra_tags   = var.extra_tags
}


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.2"

  name = local.vpc_name
  cidr = var.vpc_cidr

  azs                  = var.availability_zones
  private_subnets      = var.private_subnets # 10.0.2.0/24, 10.0.4.0/24, 10.0.6.0/24
  private_subnet_names = var.private_subnet_names
  public_subnets       = var.public_subnets # 10.0.1.0/24, 10.0.3.0/24, 10.0.5.0/24
  public_subnet_names  = var.public_subnet_names

  # manage NAT gateway
  enable_nat_gateway = false # do not have on unless we need it ($30 per month)
  # all public subnets in the same AZ use the same NAT gateway (cheaper)
  single_nat_gateway     = true
  one_nat_gateway_per_az = false


  # Tagging
  private_subnet_tags = merge(
    {
      network = "private"
    },
    var.additional_private_subnet_tags
  )

  public_subnet_tags = merge(
    {
      network = "public"
    },
    var.additional_public_subnet_tags
  )

  tags = local.tags
}
