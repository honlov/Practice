/*Copy terraform state file to blob container*/
terraform {
  backend "azurerm" {
    resource_group_name  = "honlov-res1"
    storage_account_name = "honlovdsk"
    container_name       = "backend"
    key                  = "prod.terraform.tfstate"
  }
}