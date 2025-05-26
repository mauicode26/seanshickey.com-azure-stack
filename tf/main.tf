module "resource_group" {
  source = "./modules/resource-group"
  resource_group_name = var.resource_group_name
  location            = var.location  
}

module "database" {
  source = "./modules/database"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  database_name       = var.database_name
  sku_name            = var.database_sku_name
  tags                = var.tags
  server_name         = var.database_server_name
  administrator_login = var.database_administrator_login
  administrator_login_password = var.database_administrator_login_password
}
module "dns" {
  source = "./modules/dns"
  resource_group_name = module.resource_group.resource_group_name
  domain_name         = var.domain_name
  tags                = var.tags
}

module "acr" {
  source = "./modules/acr"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  registry_name       = var.acr_registry_name
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
  tags                = var.tags
}

module "k8s" {
  source = "./modules/k8s"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  dns_zone_id = module.dns.dns_zone_id
  acr_id      = module.acr.acr_id
}