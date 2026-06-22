terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "stterraformstate9482"
    container_name       = "tfstate"
    key                  = "platform-foundation.tfstate"
  }
}

resource "azurerm_resource_group" "platform" {
  name      = var.platform_resource_group_name
  location  = var.location
  tags      = local.common_tags
}

# ==========================================
# Networking - VNet
# ==========================================

resource "azurerm_virtual_network" "hub" {
  name                 = var.virtual_network_name
  location             = var.location
  resource_group_name  = azurerm_resource_group.platform.name
  address_space        = ["10.0.0.0/16"]
  tags                 = local.common_tags
}

# ==========================================
# Networking - Subnets
# ==========================================

resource "azurerm_subnet" "app" {
  name                  = var.app_subnet_name
  virtual_network_name  = azurerm_virtual_network.hub.name
  resource_group_name   = azurerm_resource_group.platform.name
  address_prefixes      = [var.app_subnet_address_prefix]
}

resource "azurerm_subnet" "data" {
  name                  = var.data_subnet_name
  virtual_network_name  = azurerm_virtual_network.hub.name
  resource_group_name   = azurerm_resource_group.platform.name
  address_prefixes      = [var.data_subnet_address_prefix]
}

resource "azurerm_subnet" "mgmt" {
  name                  = var.management_subnet_name
  virtual_network_name  = azurerm_virtual_network.hub.name
  resource_group_name   = azurerm_resource_group.platform.name
  address_prefixes      = [var.management_subnet_address_prefix]
}

