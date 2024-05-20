resource "azurerm_resource_group" "rg1" {
  name     = "${var.prefix}-Rg"
  location = "eastus"
}

