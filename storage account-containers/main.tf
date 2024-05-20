
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id = "ce0d2d9d-53fb-40c8-b4b3-585a9e896aa4"
  tenant_id       = "1f36cecc-3aae-4d0a-a4bf-58f3d718802e"
  client_id       = "6fb2a06a-72c5-42c8-b486-3b90e73350c6"
  client_secret   = "4Fh8Q~EKw6okjikMkFlTxQfPRe6k-uOIAXfqGbkn"
}


#code for resource groupcheck 
resource "azurerm_resource_group" "RG-storage" {
  name     = var.rg_name
  location = var.rg_location
}

#code for creating a storage account
resource "azurerm_storage_account" "stg_account" {
  name                     = var.stg_account_name
  resource_group_name      = azurerm_resource_group.RG-storage.name
  location                 = azurerm_resource_group.RG-storage.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_ype

}
