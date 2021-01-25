/*Create dns name using for loop */
resource "azurerm_dns_zone" "dnszone" {
  count               = length(var.dnsname)
  name                = var.dnsname[count.index]
  resource_group_name = azurerm_resource_group.Resourcegroup.name
}