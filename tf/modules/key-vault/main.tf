resource "azurerm_key_vault" "main" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled
  sku_name                    = var.sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "Backup",
      "Delete",
      "List",
      "Purge",
      "Recover",
      "Restore",
      "Set",
    ]

    storage_permissions = [
      "Get",
    ]

    certificate_permissions = [
      "Create",
      "Delete",
      "DeleteIssuers",
      "Get",
      "GetIssuers",
      "Import",
      "List",
      "ListIssuers",
      "ManageContacts",
      "ManageIssuers",
      "SetIssuers",
      "Update",
      "Backup",
      "Purge",
      "Recover",
      "Restore",
    ]
  }

  tags = var.tags
}

# Create a certificate for your domain
resource "azurerm_key_vault_certificate" "ssl_cert" {
  name         = "ssl-certificate"
  key_vault_id = azurerm_key_vault.main.id

  certificate_policy {
    issuer_parameters {
      name = "Self" # Use "DigiCert" or "GlobalSign" for production
    }

    key_properties {
      exportable = true
      key_size   = 2048
      key_type   = "RSA"
      reuse_key  = true
    }

    lifetime_action {
      action {
        action_type = "AutoRenew"
      }

      trigger {
        days_before_expiry = 30
      }
    }

    secret_properties {
      content_type = "application/x-pkcs12"
    }

    x509_certificate_properties {
      subject            = "CN=${var.domain_name}"
      validity_in_months = 12
        key_usage = [
            "cRLSign",
            "dataEncipherment",
            "digitalSignature",
            "keyEncipherment",
            "keyAgreement",
        ]
      subject_alternative_names {
        dns_names = [
          var.domain_name,
          "www.${var.domain_name}"
        ]
      }
    }
  }

  tags = var.tags
}
