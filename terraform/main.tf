provider "azurerm" {
  features {}
  subscription_id = "155ff64f-caab-48d9-9bd8-1a03b56f2676"
}

resource "azurerm_resource_group" "ml_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "ml_storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.ml_rg.name
  location                 = azurerm_resource_group.ml_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_key_vault" "ml_kv" {
  name                = "${var.resource_group_name}-kv"
  location            = azurerm_resource_group.ml_rg.location
  resource_group_name = azurerm_resource_group.ml_rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
}

resource "azurerm_application_insights" "ml_ai" {
  name                = "${var.resource_group_name}-ai"
  location            = azurerm_resource_group.ml_rg.location
  resource_group_name = azurerm_resource_group.ml_rg.name
  application_type    = "web"
}

resource "azurerm_machine_learning_workspace" "ml_workspace" {
  name                = var.ml_workspace_name
  location            = azurerm_resource_group.ml_rg.location
  resource_group_name = azurerm_resource_group.ml_rg.name
  sku_name            = "Basic"
  key_vault_id        = azurerm_key_vault.ml_kv.id
  storage_account_id  = azurerm_storage_account.ml_storage.id
  application_insights_id = azurerm_application_insights.ml_ai.id

  identity {
    type = "SystemAssigned"
  }
}

data "azurerm_client_config" "current" {}
