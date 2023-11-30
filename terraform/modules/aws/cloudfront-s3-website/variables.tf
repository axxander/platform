## ---------------------------------------------------------------------------------------------------------------------
## VARIABLES USED BY MULTIPLE RESOURCES
## ---------------------------------------------------------------------------------------------------------------------

variable "domain" {
  type        = string
  description = "The website domain, e.g. example.com"
}


## ---------------------------------------------------------------------------------------------------------------------
## S3 VARIABLES
## ---------------------------------------------------------------------------------------------------------------------

variable "index_file_path" {
  type        = string
  description = "Path to index.html file"
}

variable "error_file_path" {
  type        = string
  description = "Path to error.html file"
}

variable "bucket_tags" {
  type        = map(string)
  default     = {}
  description = "Bucket tags"
}


## ---------------------------------------------------------------------------------------------------------------------
## CLOUDFRONT VARIABLES
## ---------------------------------------------------------------------------------------------------------------------

variable "enabled" {
  type        = bool
  default     = true
  description = "Whether the distribution is enabled to accept user requests"
}

variable "is_ipv6_enabled" {
  type        = bool
  default     = true
  description = "Whether IPv6 is enabled"
}

variable "comment" {
  type        = string
  default     = null
  description = "Any additional information about the CloudFront distribution"
}

variable "default_root_object" {
  type        = string
  default     = "index.html"
  description = "Default file CloudFront serves when user accesses the root URL of the distribution"
}

variable "cloudfront_distribution_tags" {
  type        = map(string)
  default     = {}
  description = "CloudFront distribution tags"
}

variable "min_ttl" {
  type        = number
  default     = 0
  description = "Minimum TTL for cache policy"
}

variable "max_ttl" {
  type        = number
  default     = 86400
  description = "Maximum TTL for cache policy"
}

variable "default_ttl" {
  type        = number
  default     = 3600
  description = "Default TTL for cache policy"
}


## ---------------------------------------------------------------------------------------------------------------------
## ROUTE 53 VARIABLES
## ---------------------------------------------------------------------------------------------------------------------

variable "private_hosted_zone" {
  type        = bool
  default     = false
  description = "Whether route 53 domain corresponding to domain is private"
}
