data "aws_caller_identity" "this" {}

locals {
  account_id = var.aws_account_id != null ? var.aws_account_id : data.aws_caller_identity.this.account_id

  iam_role_prefix        = format("/%s/%s/", var.organisation, var.service)
  iam_policy_prefix      = format("/%s/%s/", var.organisation, var.service)
  parameter_store_prefix = format("/%s/%s/", var.organisation, var.service)
  secrets_manager_prefix = format("/%s/%s/", var.organisation, var.service)
  security_group_prefix  = format("%s-%s-", var.organisation, var.service)
  s3_bucket_prefix       = format("%s-%s-%s-", var.organisation, local.account_id, var.service)
  vpc_name               = format("%s-%s-%s-vpc", var.organisation, local.account_id, var.env)
}
