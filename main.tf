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

  subnet {
    name             = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }

}