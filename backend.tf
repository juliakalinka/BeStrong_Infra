terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstatestoragebestrong"
    container_name       = "tfstate"
    key                  = "terraform.tfstate.${var.environment}"
  }
}
