variable "dns_zone_id" {
  description = "The ID of the DNS zone to use for the Kubernetes cluster."
  type        = string
}
variable "acr_id" {
    description = "The ID of the Azure Container Registry to use with the Kubernetes cluster."
    type        = string
}
variable "location" {
    description = "The Azure region where the Kubernetes cluster will be deployed."
    type        = string
}
variable "resource_group_name" {
    description = "The name of the resource group where the Kubernetes cluster will be created."
    type        = string
}