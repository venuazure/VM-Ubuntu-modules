

# Create virtual machine
resource "azurerm_linux_virtual_machine" "virtal-machine" {
  name                  = "vm-ubuntu"
  location              = var.location
  resource_group_name   = var.res-grp-name
  network_interface_ids = [var.nic-id]
  size                  = var.vm-size
  disable_password_authentication = false

  os_disk {
    name                 = "vm-OsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  computer_name  = "hostname"
  admin_username = var.username
  admin_password = var.password

/* 
  admin_ssh_key {
    username   = var.username
    public_key = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
  } */

/*   boot_diagnostics {
    storage_account_uri = azurerm_storage_account.my_storage_account.primary_blob_endpoint
  } */

}