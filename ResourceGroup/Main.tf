provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.20.0"
  features {}
}

resource "azurerm_resource_group" "RG1" {
  name     = "TFAzureLab-rg"
  location = var.location
  tags = {
    Enviroment = "Dev"
  }
}
# Create Virtual Network
resource "azurerm_virtual_network" "TFAzure-vnet" {
  name                = "vnet-dev-${var.location}-001"
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.RG1.location
  resource_group_name = azurerm_resource_group.RG1.name
}
# Create Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet-dev-${var.location}-001"
  resource_group_name  = azurerm_resource_group.RG1.name
  virtual_network_name = azurerm_virtual_network.TFAzure-vnet.name
  address_prefix       = "10.0.0.0/24"
}
# Create Public IP
resource "azurerm_public_ip" "publicip" {
  name                = "publicIP"
  location            = azurerm_resource_group.RG1.location
  resource_group_name = azurerm_resource_group.RG1.name
  allocation_method   = "Static"
}
# Create Network Security Group
resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-001"
  location            = azurerm_resource_group.RG1.location
  resource_group_name = azurerm_resource_group.RG1.name
}
# Create NSG rule
resource "azurerm_network_security_rule" "nsg_rule" {
  for_each                    = var.inbound_rules
  name                        = "port_${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.RG1.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}
# Associate NSG to subnet ::::COMMENT WHILE DISTORYING::::
resource "azurerm_subnet_network_security_group_association" "nsg_associate" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
# Associate NSG to NIC ::::COMMENT WHILE DISTORYING::::
resource "azurerm_network_interface_security_group_association" "nsg_associate_nic" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
# Create Network Interface
resource "azurerm_network_interface" "nic" {
  name                = "nic-dev"
  location            = azurerm_resource_group.RG1.location
  resource_group_name = azurerm_resource_group.RG1.name
  #network_security_group_id = azurerm_network_security_group.nsg.id
  ip_configuration {
    name                          = "nic-cfg"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}
# Create Virtual Machine
resource "azurerm_virtual_machine" "vm" {
  name                  = "TFAzure-vm"
  location              = azurerm_resource_group.RG1.location
  resource_group_name   = azurerm_resource_group.RG1.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = "Standard_B1s"
  storage_os_disk {
    name              = "disk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = lookup(var.managed_disk_type, var.location, "Standard_LRS")
  }
  storage_image_reference {
    publisher = var.os.publisher
    offer     = var.os.offer
    sku       = var.os.sku
    version   = var.os.version
  }
  os_profile {
    computer_name  = "tfAzuredev01"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}
