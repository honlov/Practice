resourcename  = "TRG1"
location      = "East US"
tags          = { enviornment = "demo", owner = "jp", purpose = "TFdemo" }
tag2          = { resource = "virtualmachines", costcentre = "demotfcource" }
storagename   = "tfstoragehonlov"
containername = "tfdemocontainer"
dnsname       = ["honlov.com", "honlov1.com", "honlov2.com", "honlov3.com"]
networkrule = [
  {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "HTTPS"
    priority                   = 101
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "443"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "RDP"
    priority                   = 102
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
]
enviornment   = "demo"
account_type  = "standard_GRS"
address_space = ["10.100.0.0/16", "10.100.1.0/24", "10.100.2.0/24", "10.100.3.0/24"]