resource "azurerm_kubernetes_cluster" "k8s_cluster" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "k8s"
  web_app_routing {
    dns_zone_ids = [var.dns_zone_id]
  }
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_A2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_role_assignment" "k8s_acr_assignment" {
  principal_id                     = azurerm_kubernetes_cluster.k8s_cluster.identity[0].principal_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true
}