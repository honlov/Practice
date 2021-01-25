/*Create Cosmo db on conditional basis, if var environement is prod 
it will create 2 cosmo db if anything else will create 1 only*/
/*resource "azurerm_cosmosdb_account" "db" {
  count               = var.enviornment == "prod" ? 2 : 1
  name                = "tf-cosmos-db${count.index}"
  location            = azurerm_resource_group.Resourcegroup.location
  resource_group_name = azurerm_resource_group.Resourcegroup.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  enable_automatic_failover = true

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }

  geo_location {
    location          = azurerm_resource_group.Resourcegroup.location
    failover_priority = 0
  }
}*/