# Create network interface
resource "azurerm_network_interface" "vm-nic" {
  name                = "vm-NIC"
  location            = var.location
  resource_group_name = var.res-grp-name

  ip_configuration {
    name                          = "vm_nic_configuration"
    subnet_id                     = var.subnet-id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public-ip-address-id
  }
}