variable "security_group_name" {
  type        = string
  description = "The security group name"
}

variable "security_group_description" {
  type        = string
  description = "The security group description"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC the security group resides in"
}

variable "ingress_rules_with_cidr" {
  type = set(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "The ingress rules with CIDR source"
}

variable "ingress_rules_with_sg" {
  type = set(object({
    description        = string
    from_port          = number
    to_port            = number
    protocol           = string
    security_group_ids = list(string)
  }))
  description = "The ingress rules with security group source"
}

variable "egress_rules_with_cidr" {
  type = set(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "The egress rules with CIDR source"
}

variable "egress_rules_with_sg" {
  type = set(object({
    description        = string
    from_port          = number
    to_port            = number
    protocol           = string
    security_group_ids = list(string)
  }))
  description = "The egress rules with security group source"
}

variable "create_default_egress_rule" {
  type        = bool
  default     = true
  description = "Whether to create a default egress rule"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Security group tags"
}
