variable "resource_group_name" {
  description = "The name of the resource group where the Key Vault will be created"
  type        = string
}

variable "location" {
  description = "The Azure region where the Key Vault will be created"
  type        = string
}

variable "key_vault_name" {
  description = "The name of the Key Vault"
  type        = string
}

variable "tenant_id" {
  description = "The Azure tenant ID"
  type        = string
}

variable "domain_name" {
  description = "The domain name for SSL certificate"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Key Vault"
  type        = map(string)
  default     = {}
}

variable "sku_name" {
  description = "The SKU name for the Key Vault"
  type        = string
  default     = "standard"
}

variable "enabled_for_disk_encryption" {
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault"
  type        = bool
  default     = true
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted"
  type        = number
  default     = 7
}

variable "purge_protection_enabled" {
  description = "Is Purge Protection enabled for this Key Vault?"
  type        = bool
  default     = false
}
