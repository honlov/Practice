provider "azurerm" {
  features {}
  version = "2.9.0"
}
# get existing resource group
data "azurerm_resource_group" "example" {
  name = "TF-RG" # create Resource group using Azure portal TF-RG
}
# create VNET in existing Resource group
resource "azurerm_virtual_network" "TFAzure-vnet" {
  name                = "TfAzure-vnet"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  address_space       = ["10.2.0.0/16"]
  dns_servers         = ["8.8.8.8", "8.8.4.4"]
  tags = {
    enviornment = "Dev"
  }
}
# Create subnet in Vnet
resource "azurerm_subnet" "TFAzure-sub" {
  name                 = "testsubnet"
  resource_group_name  = data.azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.TFAzure-vnet.name
  address_prefix       = "10.2.1.0/24"
}
# Get Existing Vnet details
data "azurerm_virtual_network" "vnet" {
  name                = "testvnet1" # Create Vnet using Azure portal in TF-RG resource group with name testvnet1
  resource_group_name = data.azurerm_resource_group.example.name
}
# Create subnet in existing Vnet
resource "azurerm_subnet" "TF-sub" {
  name                 = "2"
  resource_group_name  = data.azurerm_resource_group.example.name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefix       = "10.3.2.0/24"
} 