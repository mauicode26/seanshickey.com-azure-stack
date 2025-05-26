variable "resource_group_name" {
  description = "The name of the resource group where the DNS zone will be created"
  type        = string
}

variable "domain_name" {
  description = "The domain name for the DNS zone (e.g., example.com)"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the DNS zone"
  type        = map(string)
  default     = {}
}