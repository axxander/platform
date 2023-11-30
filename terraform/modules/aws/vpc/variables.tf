variable "vpc_cidr" {
  type        = string
  description = "The VPC CIDR"
}

variable "availability_zones" {
  type        = list(string)
  description = "The list of AWS availability zones for the AWS region"
}

variable "private_subnets" {
  type        = list(string)
  description = "The private subnet CIDRs"
}

variable "private_subnet_names" {
  type        = list(string)
  default     = []
  description = "The private subnet names"
}

variable "public_subnets" {
  type        = list(string)
  description = "The public subnet CIDRs"
}

variable "public_subnet_names" {
  type        = list(string)
  default     = []
  description = "The public subnet names"
}

variable "additional_private_subnet_tags" {
  type        = map(string)
  default     = {}
  description = "The private subnets tags"
}

variable "additional_public_subnet_tags" {
  type        = map(string)
  default     = {}
  description = "The public subnets tags"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "The VPC tags"
}
