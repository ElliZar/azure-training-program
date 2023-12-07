variable "client_secret" {
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "training-resource-group" {
  name     = "training-resource-group"
  location = "eastus"
}

resource "azurerm_storage_account" "training-resource-group" {
  name                     = "trngfirststeps"
  
  resource_group_name      = azurerm_resource_group.training-resource-group.name
  location                 = azurerm_resource_group.training-resource-group.location
  account_tier             = "Standard"
  account_replication_type = "GRS"


  static_website {
    index_document = "index.html"
  }
}
