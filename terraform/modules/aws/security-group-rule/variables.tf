variable "type" {
  type        = string
  description = "The security group rule type"
  validation {
    condition     = ["ingress", "egress"]
    error_message = "Allowed values for type are \"ingress\" or \"egress\""
  }
}

variable "description" {
  type        = string
  description = "The security group rule description"
}

variable "from_port" {
  type        = number
  description = "The security group rule from port"
}

variable "to_port" {
  type        = string
  description = "The security group rule to port"
}

variable "protocol" {
  type        = string
  description = "The security group rule protocol"
}

variable "security_group_id" {
  type        = string
  description = "The security group ID to apply this security group rule to"
}

variable "cidr_blocks" {
  type        = list(string)
  default     = null
  description = "The source CIDR blocks to allow"
}

variable "security_group_id" {
  type        = list(string)
  default     = null
  description = "The source secutiry group IDs to allow"
}
