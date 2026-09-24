output "keyvault_id" {
  description = "The ID of the Key Vault"
  value       = azurerm_key_vault.keyvault.id
}

output "keyvault_uri" {
  description = "URI of the Key Vault"
  value       = azurerm_key_vault.keyvault.vault_uri
}