terragrunt_version_constraint = "0.45.2"

locals {
  # Automatically load account-level variables
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))

  # Automatically load region-level variables
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Static config
  config       = yamldecode(file("config.yml"))
  organisation = lookup(local.config, "organisation")
  service      = lookup(local.config, "service")
  owner        = lookup(local.config, "owner")

  # Remote state
  aws_region                 = local.region_vars.locals.aws_region
  aws_account_id             = local.account_vars.locals.aws_account_id
  remote_state_bucket_name   = "${local.organisation}-${local.aws_account_id}-terraform-remote-state-bucket"
  remote_state_dynamodb_name = "${local.organisation}-${local.aws_account_id}-terraform-remote-state-lock"
  remote_state_key           = "services/${local.service}/${path_relative_to_include()}/terraform.tfstate"

  # IAM
  aws_iam_assumed_role_name = "TerragruntRole"

  # Provider configuration
  aws_provider_version = "~> 4.0"
}


# Generate AWS provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "skip"
  contents  = <<EOF
provider "aws" {
  region              = "${local.aws_region}"
  assume_role {
    role_arn = "arn:aws:iam::${local.aws_account_id}:role/${local.aws_iam_assumed_role_name}"
  }
  allowed_account_ids = ["${join("\", \"", local.config.aws_account_ids)}"]
}
EOF
}


# Generate AWS provider version block
generate "versions" {
  path      = "versions.tf"
  if_exists = "skip"
  contents  = <<EOF
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "${local.aws_provider_version}"
    }
  }
}
EOF
}


# Generate AWS backends
remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = local.remote_state_bucket_name
    key            = local.remote_state_key
    region         = local.aws_region
    dynamodb_table = local.remote_state_dynamodb_name

    s3_bucket_tags = {
      Name         = local.remote_state_bucket_name
      organisation = local.organisation
      owner        = local.owner
      service      = local.service
    }

    dynamodb_table_tags = {
      Name         = local.remote_state_dynamodb_name
      organisation = local.organisation
      owner        = local.owner
      service      = local.service
    }
  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}


inputs = merge(
  # account, region and enviornment variables
  local.account_vars.locals,
  local.region_vars.locals,
  local.environment_vars.locals,
  # default
  {
    default_tags = {
      owner        = local.owner
      organisation = local.organisation
      service      = local.service
    },
    owner        = local.owner,
    organisation = local.organisation,
    service      = local.service,
  },
)
