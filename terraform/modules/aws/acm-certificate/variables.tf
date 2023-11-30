variable "domain" {
  type        = string
  description = "The website domain, e.g. example.com"
}

variable "private_hosted_zone" {
  type        = bool
  default     = false
  description = "Whether route 53 domain corresponding to domain is private"
}

variable "certificate_manager_tags" {
  type        = map(string)
  default     = {}
  description = "CloudFront distribution tags"
}
