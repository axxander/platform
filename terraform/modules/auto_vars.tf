variable "organisation" {
  type        = string
  default     = "alexgregorydotio"
  description = "The name of the organisation"
}

variable "service" {
  type        = string
  description = "The name of the service"
}

variable "env" {
  type        = string
  description = "The name of the environment"
}

variable "extra_tags" {
  type        = map(string)
  default     = {}
  description = "Additional default tags"
}
