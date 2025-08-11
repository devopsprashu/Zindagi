terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.39.0"
    }
  }
}

provider "azurerm" {
  features{}
  subscription_id="fadfa500-48fa-4d7d-ae72-215103d56b2f"
}

resource "azurerm_resource_group" "hope" {
  name     = "hope-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "hopestg" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.hope.name
  location                 = azurerm_resource_group.hope.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}