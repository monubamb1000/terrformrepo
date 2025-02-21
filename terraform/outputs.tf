output "resource_group_name" {
  value = azurerm_resource_group.ml_rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.ml_storage.name
}

output "ml_workspace_name" {
  value = azurerm_machine_learning_workspace.ml_workspace.name
}
