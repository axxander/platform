# Include the root `terragrunt.hcl` configuration
include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_terragrunt_dir()}/../../../../..///modules/aws/s3-bucket"
}

inputs = {}