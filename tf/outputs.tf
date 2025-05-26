# filepath: /Users/sean/Documents/Coding/Terraform/azure-testing/outputs.tf

# Database outputs
output "database_server_id" {
  description = "The ID of the MSSQL server"
  value       = module.database.server_id
}

output "database_server_name" {
  description = "The name of the MSSQL server"
  value       = module.database.server_name
}

output "database_server_fqdn" {
  description = "The fully qualified domain name of the MSSQL server"
  value       = module.database.server_fqdn
}

output "database_id" {
  description = "The ID of the MSSQL database"
  value       = module.database.database_id
}

output "database_name" {
  description = "The name of the MSSQL database"
  value       = module.database.database_name
}

output "database_connection_string" {
  description = "The connection string for the database"
  value       = module.database.connection_string
  sensitive   = true
}

# Resource Group outputs
output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.resource_group.resource_group_name
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = var.location
}
output "k8s_cluster_name" {
  description = "The name of the Kubernetes cluster"
  value       = module.k8s.cluster_name
}

# DNS outputs
output "dns_zone_id" {
  description = "The ID of the DNS zone"
  value       = module.dns.dns_zone_id
}

output "dns_zone_name" {
  description = "The name of the DNS zone"
  value       = module.dns.dns_zone_name
}

output "dns_name_servers" {
  description = "The name servers for the DNS zone"
  value       = module.dns.name_servers
}