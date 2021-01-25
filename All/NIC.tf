/*Create Network inferface cards for Virtual machines*/
resource "azurerm_network_interface" "nic" {
  count               = 3
  name                = "vm-nic${count.index}"
  location            = azurerm_resource_group.Resourcegroup.location
  resource_group_name = azurerm_resource_group.Resourcegroup.name

  ip_configuration {
    name                          = "testconfig"
    subnet_id                     = "${azurerm_subnet.azsubnet.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.publicip.*.id, count.index)
  }
}