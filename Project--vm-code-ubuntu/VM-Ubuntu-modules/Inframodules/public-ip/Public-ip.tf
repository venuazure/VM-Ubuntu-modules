

resource "azurerm_public_ip" "vm_public_ip" {
  name                = "vm-PublicIP"
  location            = var.location
  resource_group_name = var.res-grp-name
  allocation_method   = "Dynamic"
  
}
