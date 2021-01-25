location           = "eastus"
admin_username     = "azureuser"
admin_password     = "${data.azurerm_key_vault_secret.mySecret.value}
vnet_address_space = ["10.0.0.0/16", "10.1.0.0/16"]
vnet_info          = ["TFAzure-Vnet", true, ["10.0.0.0/16", "10.1.0.0/16"]]
os = {
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "16.04.0-LTS"
  version   = "latest"
}
inbound_rules = {
  101 = 8080
  102 = 22
}