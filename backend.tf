terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstatestoragebestrong1"
    container_name       = "tfstate"
    key                  = "tfstate"
  }
}
