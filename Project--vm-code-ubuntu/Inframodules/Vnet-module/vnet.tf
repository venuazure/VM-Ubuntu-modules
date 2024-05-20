
resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet1-name
  location            = var.location
  resource_group_name = var.res-gp-name
  address_space       = var.address-sprace

}

resource "azurerm_subnet" "subnet01" {

  name                 = var.subnet-name
  resource_group_name  = azurerm_virtual_network.vnet1.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = var.address-prefix
  depends_on = [ azurerm_virtual_network.vnet1 ]
  
}

 
