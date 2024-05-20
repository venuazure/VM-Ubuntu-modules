# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "sec-group-to-interface" {
  network_interface_id      = var.nic-id
  network_security_group_id = var.network-sec-group-id
}
