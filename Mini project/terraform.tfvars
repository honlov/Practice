MainRG             = "Mini-Project"
client_secret      = "JR.e_mnFAkL-g1FX8b~E7I9rCxfP2Pj277"
location           = "eastus"
admin_username     = "azureuser"
KeyVaultname       = "keyvault-honlov"
KeyVault_RG        = "cloud-shell-storage-eastus"
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