variable "keyvault_name" {
  description = "The name of the Key Vault"
  type        = string
}

variable "location" {
  description = "The Azure region where the Key Vault will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Key Vault will be created"
  type        = string
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID"
  type        = string
}