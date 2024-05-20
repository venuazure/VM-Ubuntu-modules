output "vnet1-name" {
  value = azurerm_virtual_network.vnet1.name
}

output "location" {
  value = azurerm_virtual_network.vnet1.location
}

output "res-gp-name" {
  value = azurerm_virtual_network.vnet1.resource_group_name
}

output "address-sprace" {
  value = azurerm_virtual_network.vnet1.address_space
}

output "subnet-name" {
  value = azurerm_subnet.subnet01.name
}

output "subnet-id" {
  value = azurerm_subnet.subnet01.id
}