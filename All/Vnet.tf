/*
resource "azurerm_virtual_network" "azvnet" {
  name                = "auzrevnettf"
  location            = azurerm_resource_group.Resourcegroup.location
  resource_group_name = azurerm_resource_group.Resourcegroup.name
  address_space       = [element(var.address_space, 0)]
  tags                = var.tags
}
resource "azurerm_subnet" "azsubnet" {
  name                 = "subnetfortf"
  resource_group_name  = azurerm_resource_group.Resourcegroup.name
  virtual_network_name = azurerm_virtual_network.azvnet.name
  address_prefixes     = element(var.address_space,3)
}*/
resource "azurerm_virtual_network" "azvnet" {
  name                = "auzrevnettf"
  resource_group_name = azurerm_resource_group.Resourcegroup.name
  location            = azurerm_resource_group.Resourcegroup.location
  address_space       = [element(var.address_space, 0)]
}

