locals {
  name = format("%s%s", module.resource_naming.security_group_prefix, var.security_group_name)
}

module "resource_naming" {
  source = "../resource-naming"

  # auto_vars
  organisation = var.organisation
  service      = var.service
  env          = var.env
  extra_tags   = var.extra_tags
}

resource "aws_security_group" "this" {
  name        = local.name
  description = var.security_group_description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = length(var.ingress_rules_with_cidr) > 0 ? var.ingress_rules_with_cidr : []
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "ingress" {
    for_each = length(var.ingress_rules_with_sg) > 0 ? var.ingress_rules_with_sg : []
    content {
      description        = ingress.value.description
      from_port          = ingress.value.from_port
      to_port            = ingress.value.to_port
      protocol           = ingress.value.protocol
      security_group_ids = ingress.value.security_group_ids
    }
  }

  dynamic "egress" {
    for_each = length(var.egress_rules_with_sg) > 0 ? var.egress_rules_with_sg : []
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = length(var.egress_rules_with_sg) > 0 ? var.egress_rules_with_sg : []
    content {
      description        = egress.value.description
      from_port          = egress.value.from_port
      to_port            = egress.value.to_port
      protocol           = egress.value.protocol
      security_group_ids = egress.value.security_group_ids
    }
  }

  # default egress
  dynamic "egress" {
    for_each = var.create_default_egress_rule ? tolist([1]) : []
    content {
      description = "Default egress rule"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = merge(
    var.tags,
    var.extra_tags,
    {
      Name = local.name
    }
  )
}
