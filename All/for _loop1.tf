/*Creating Network security rule using for loop*/
resource "azurerm_network_security_group" "nsgrule" {
  name                = "Auzrenetworksecuritygrouprule"
  resource_group_name = azurerm_resource_group.Resourcegroup.name
  location            = azurerm_resource_group.Resourcegroup.location
  dynamic "security_rule" {
    iterator = rule
    for_each = var.networkrule
    content {
      name                       = rule.value.name
      priority                   = rule.value.priority
      direction                  = rule.value.direction
      access                     = rule.value.access
      protocol                   = rule.value.protocol
      source_port_range          = rule.value.source_port_range
      destination_port_range     = rule.value.destination_port_range
      source_address_prefix      = rule.value.source_address_prefix
      destination_address_prefix = rule.value.destination_address_prefix
    }
  }
}