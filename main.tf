terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "stterraformstate9482"
    container_name       = "tfstate"
    key                  = "platform-foundation.tfstate"
  }
}

resource "azurerm_resource_group" "networking" {
  name      = var.networking_resource_group_name
  location  = var.location
}

resource "azurerm_virtual_network" "networking" {
  name                 = var.virtual_network_name
  location             = var.location
  resource_group_name  = var.networking_resource_group_name
}

resource "azurerm_subnet" "networking" {
  name             = var.app_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.networking_resource_group_name
  address_prefixes = [var.app_subnet_address_prefix]
}

resource "azurerm_subnet" "networking" {
  name             = var.data_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.networking_resource_group_name
  address_prefixes = [var.data_subnet_address_prefix]
}

resource "azurerm_subnet" "networking" {
  name             = var.management_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.networking_resource_group_name
  address_prefixes = [var.management_subnet_address_prefix]
}