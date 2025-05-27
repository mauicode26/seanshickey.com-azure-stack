// Variables file
variable "location" {
  description = "Azure region"
  default     = "East US"
}

variable "vm_admin_username" {
  description = "Admin username for the VM"
}

variable "vm_admin_password" {
  description = "Admin password for the VM"
}

variable "vm_computer_name" {
  description = "Computer name for the VM"
}
variable "subscription_id" {
  description = "Azure subscription ID"
}
variable "vm_address_space" {
  description = "The address space for the Virtual Machine"
  type        = string  
}
variable "vm_address_prefixes" {
  description = "The address prefixes for the Virtual Machine"
  type        = string
}
variable "customer" {
  description = "Customer name"
  type        = string
}
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}
variable "database_administrator_login_password" {
  description = "The administrator password for the VM"
  type        = string
  sensitive   = true
}
variable "database_administrator_login" {
  description = "The administrator login for the VM"
  type        = string
}

# Database variables
variable "database_name" {
  description = "The name of the database to create"
  type        = string
}

variable "database_server_name" {
  description = "The name of the MSSQL server"
  type        = string
}

variable "database_sku_name" {
  description = "The SKU name for the database"
  type        = string
  default     = "S0"
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}

variable "acr_registry_name" {
  description = "Name of the container registry"
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9]+$", var.acr_registry_name))
    error_message = "Registry name must contain only alphanumeric characters."
  }
}
variable "acr_sku" {
  description = "SKU for the container registry"
  type        = string
}
variable "acr_admin_enabled" {
  description = "Enable admin user for the registry"
  type        = bool
  default     = true
}
variable "domain_name" {
  description = "The domain name for the DNS zone (e.g., seanshickey.com)"
  type        = string
}
variable "k8s_cluster_name" {
  description = "The name of the Kubernetes cluster"
  type        = string 
}

variable "key_vault_name" {
  description = "The name of the Key Vault for certificate management"
  type        = string
}