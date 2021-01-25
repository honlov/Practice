/*Create Public ip address for virtual machines.*/
resource "azurerm_public_ip" "publicip" {
  count               = 3
  name                = "public${count.index}"
  resource_group_name = azurerm_resource_group.Resourcegroup.name
  location            = azurerm_resource_group.Resourcegroup.location
  allocation_method   = "Static"
}