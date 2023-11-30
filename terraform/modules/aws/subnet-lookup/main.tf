data "aws_subnets" "private" {
  count = var.enable_private_subnet_lookup ? 1 : 0

  # filter by vpc id
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  # filter by tag
  filter {
    name   = "tag:${var.subnet_privacy_tag}"
    values = [var.subnet_privacy_tag_value]
  }
}

data "aws_subnet" "private" {
  for_each = toset(data.aws_subnets.private[0].ids)

  id = each.value
}

data "aws_subnets" "public" {
  count = var.enable_public_subnet_lookup ? 1 : 0

  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  filter {
    name   = "tag:${var.subnet_privacy_tag}"
    values = [var.subnet_privacy_tag_value]
  }
}

data "aws_subnet" "public" {
  for_each = toset(data.aws_subnets.public[0].ids)

  id = each.value
}
