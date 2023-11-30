variable "domain" {
  type        = string
  description = "The domain"
}

variable "namecheap_user_name" {
  type        = string
  sensitive   = true
  description = "The Namecheap user name"
}

variable "namecheap_api_user" {
  type        = string
  sensitive   = true
  description = "The Namecheap API user"
}

variable "namecheap_api_key" {
  type        = string
  sensitive   = true
  description = "The Namecheap API key"
}

variable "namecheap_mode" {
  type        = string
  default     = "OVERWRITE"
  description = "The namecheap record mode (see Namecheap docs)"
}
