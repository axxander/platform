variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
}

variable "enable_private_subnet_lookup" {
  type        = bool
  default     = true
  description = "Whether to enable private subnet lookup"
}

variable "enable_public_subnet_lookup" {
  type        = string
  description = "Whether to enable public subnet lookup"
}

variable "subnet_privacy_tag" {
  type        = string
  default     = "???" #TODO: populate when decided on tagging policy
  description = "Name of tag used to differentiate public and private resources"
}

variable "subnet_privacy_tag_value" {
  type        = string
  description = "Value of subnet privacy tag"
}
