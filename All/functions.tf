/*Create storage account using functions, like trim, split, element etc*/
resource "azurerm_storage_account" "Bootdagnostic" {
  name                     = "bootdiaghonlov"
  resource_group_name      = azurerm_resource_group.Resourcegroup.name
  location                 = azurerm_resource_group.Resourcegroup.location
  account_tier             = trim(var.account_type, "_GRS")
  account_replication_type = element(split("_", var.account_type), 1)
}