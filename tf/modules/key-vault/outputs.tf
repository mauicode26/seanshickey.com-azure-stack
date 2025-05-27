output "key_vault_id" {
  description = "The ID of the Key Vault"
  value       = azurerm_key_vault.main.id
}

output "key_vault_name" {
  description = "The name of the Key Vault"
  value       = azurerm_key_vault.main.name
}

output "key_vault_uri" {
  description = "The URI of the Key Vault"
  value       = azurerm_key_vault.main.vault_uri
}

output "certificate_id" {
  description = "The ID of the SSL certificate"
  value       = azurerm_key_vault_certificate.ssl_cert.id
}

output "certificate_secret_id" {
  description = "The secret ID of the SSL certificate"
  value       = azurerm_key_vault_certificate.ssl_cert.secret_id
}

output "certificate_thumbprint" {
  description = "The thumbprint of the SSL certificate"
  value       = azurerm_key_vault_certificate.ssl_cert.thumbprint
}

output "certificate_data" {
  description = "The certificate data"
  value       = azurerm_key_vault_certificate.ssl_cert.certificate_data
  sensitive   = true
}
