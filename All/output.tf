output "rgname" {
  value = azurerm_resource_group.Resourcegroup.name
}
output "storage" {
  value = azurerm_storage_account.storage.name
}
output "container" {
  value = azurerm_storage_container.example[*].name
}
/*output "container_backend" {
  value = azurerm_storage_container.Backend.name
}*/
/*For loop*/
output "dnszone" {
  value = [for i in var.dnsname : upper(i)]
}
output "nsgrule" {
  value = [for i in var.networkrule : (i)]
}
output "azvnet" {
  value = azurerm_virtual_network.azvnet.name
}
output "Virtual_Machine" {
  value = azurerm_virtual_machine.vm-main.*.name
}
output "publicip" {
  value = azurerm_public_ip.publicip.*.ip_address
}
output "nic" {
  value = azurerm_network_interface.nic.*.name
}
output "password" {
  value = random_password.password.result
}
