output "dns_zone_id" {
  description = "The ID of the created DNS zone"
  value       = azurerm_dns_zone.main.id
}

output "dns_zone_name" {
  description = "The name of the DNS zone"
  value       = azurerm_dns_zone.main.name
}

output "name_servers" {
  description = "The name servers for the DNS zone"
  value       = azurerm_dns_zone.main.name_servers
}