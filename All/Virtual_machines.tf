/*Create Linux Virtual machines.*/
resource "azurerm_virtual_machine" "vm-main" {
  count                 = 3
  name                  = "azurevm${count.index}"
  location              = azurerm_resource_group.Resourcegroup.location
  resource_group_name   = azurerm_resource_group.Resourcegroup.name
  network_interface_ids = [element(azurerm_network_interface.nic.*.id, count.index)]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk${count.index}" #count will create 3 disks
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = random_password.password.result
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags        = merge(var.tags, var.tag2) # Merge will merge both tags.
}