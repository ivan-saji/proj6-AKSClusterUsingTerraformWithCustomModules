variable "aks_name" {
  description = "The name of the AKS cluster to create."
  type        = string
}

variable "location" {
  description = "The location of the AKS cluster to create."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the AKS cluster will be created."
  type        = string
}

variable "service_principal_name" {
  type = string
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "client_id" {}
variable "client_secret" {
  type = string
  sensitive = true
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster."
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster."
  type        = number
}

variable "vm_size" {
  description = "The size of the virtual machines in the AKS cluster."
  type        = string
}