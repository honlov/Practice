variable "location" {}
variable "admin_username" {
  type        = string
  description = "Administrator username for Virutal machine"
}
variable "KeyVaultname" {
  type        = string
  description = "Password must meet Azure Complexity requirements"
}
variable "vnet_address_space" {
  type        = list(any)
  description = "Address space for Virtual Network"
  default     = ["10.0.0.0/16"]
}
variable "vnet_info" {
  type        = tuple([string, bool, list(string)])
  description = "Vnet Information"
}
variable "managed_disk_type" {
  type        = map(any)
  description = "Disk type Premium in Primary location Stardard in DR Location"
  default = {
    westus2 = "Premium_LRS"
    eastus  = "Standard_LRS"
  }
}
variable "os" {
  description = "OS image to deploy"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}
variable "inbound_rules" {
  type        = map(any)
  description = "A map of allowed inbound ports and their priority value"
}
variable "KeyVault_RG" {
  type        = string
  description = "Key Vault Resource group name"
}
variable "MainRG" {
  type        = string
  description = "Main Resource group where all resources has to build"
}
variable "client_secret" {
  type = string
}