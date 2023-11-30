include "root" {
  path   = find_in_parent_folders()
  expose = true
}

locals {
}

terraform {
  source = "${get_terragrunt_dir()}/../../../../..///modules/multi-provider/aws_route53_zone_with_namecheap"
}

inputs = {
  domain = "alexgregory.io"

  # Need to be passed via environment or cli
  // namecheap_user_name
  // namecheap_api_user
  // namecheap_api_key
}
