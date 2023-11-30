include "root" {
  path   = find_in_parent_folders()
  expose = true
}

locals {
}

terraform {
  source = "${get_terragrunt_dir()}/../../../../../..///modules/aws/acm-certificate"
}

inputs = {
  domain = "alexgregory.io"
}
