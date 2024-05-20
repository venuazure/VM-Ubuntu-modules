resource "azurerm_storage_account" "st-01" {
    name = "stbackend"
    resource_group_name = azurerm_resource_group.rg1.name
    location = azurerm_resource_group.rg1.location
    account_replication_type = "LRS"
    account_tier = "Standard"
  
}

resource "azurerm_storage" "name" {
  
}