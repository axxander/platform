include "root" {
  path   = find_in_parent_folders()
  expose = true
}

locals {
}

terraform {
  source = "${get_terragrunt_dir()}/../../../../../..///modules/aws/cloudfront-s3-website"
}

inputs = {
  domain = "alexgregory.io"
  index_file_path = "${get_terragrunt_dir()}/files/index.html"
  error_file_path = "${get_terragrunt_dir()}/files/error.html"
}
