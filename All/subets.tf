/*Create subnets for virtual machine select from list */
resource "azurerm_subnet" "azsubnet" {
  name                 = "subnetfortfcourse"
  resource_group_name  = azurerm_resource_group.Resourcegroup.name
  virtual_network_name = azurerm_virtual_network.azvnet.name
  address_prefix       = element(var.address_space, 2)
}
# Associate the NSG to subnet
resource "azurerm_subnet_network_security_group_association" "attachsubnet" {
  subnet_id                 = azurerm_subnet.azsubnet.id
  network_security_group_id = azurerm_network_security_group.nsgrule.id
}