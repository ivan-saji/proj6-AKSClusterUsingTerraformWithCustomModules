variable "resource_group_name" {
  description = "The name of the resource group to create."
  type        = string
}

variable "location" {
  description = "The location of the resource group to create."
  type        = string
}

variable "application_name" {
  description = "The name of the application for which the service principal will be created."
  type        = string
}

variable "keyvault_name" {
  description = "The name of the Key Vault to create."
  type        = string
}
