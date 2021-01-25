provider "azurerm" {
  version = "~>1.44"
}
/*Create Resource Group*/
resource "azurerm_resource_group" "Resourcegroup" {
  name     = var.resourcename
  location = var.location
  tags     = var.tags
}
/*Create Lock on Resource Group
resource "azurerm_management_lock" "resource-group-level" {
  name       = "Do not delete"
  scope      = azurerm_resource_group.Resourcegroup.id
  lock_level = "CanNotDelete"
}*/
/*Create Storage Account*/
resource "azurerm_storage_account" "storage" {
  name                     = var.storagename
  resource_group_name      = azurerm_resource_group.Resourcegroup.name
  location                 = azurerm_resource_group.Resourcegroup.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags                     = var.tags
}
#Create Container named Backend
/*resource "azurerm_storage_container" "Backend" {
  name                  = "backend"
  resource_group_name   = azurerm_resource_group.Resourcegroup.name
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}*/
/*Create 4 containers with count.index*/
resource "azurerm_storage_container" "example" {
  count                 = 4
  name                  = "${var.containername}${count.index}"
  resource_group_name   = azurerm_resource_group.Resourcegroup.name
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}
