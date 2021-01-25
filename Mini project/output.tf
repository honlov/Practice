output "public-ip" {
  description = "Public IP Address of Virtual Machine"
  value       = azurerm_public_ip.publicip.ip_address
}
output "vnet-info" {
  value       = var.vnet_info
  description = "Vnet Information"
}
output "admin_username" {
  value = var.admin_username
}
output "admin_password" {
  value = data.azurerm_key_vault_secret.mySecret.value
}