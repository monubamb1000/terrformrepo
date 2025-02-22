variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "ml_workspace_name" {
  description = "The name of the machine learning workspace"
  type        = string
}

variable "subscription_id" {
  description = "The subscription ID for the Azure account"
  type        = string
}
