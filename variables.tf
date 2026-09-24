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

variable "aks_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "node_count" {
  description = "Number of AKS nodes"
  type        = number
}

variable "vm_size" {
  description = "VM size for AKS nodes"
  type        = string
}