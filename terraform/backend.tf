terraform {
  backend "azurerm" {
    resource_group_name  = "monuresourcergmo"
    storage_account_name = "monurstormo"
    container_name       = "monuresocont"
    key                  = "terraform.tfstate"
    
  }
}
