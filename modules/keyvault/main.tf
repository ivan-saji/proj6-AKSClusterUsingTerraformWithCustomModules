#Mention the keyvault code here

resource "azurerm_key_vault" "keyvault" {
  name                       = var.keyvault_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  tenant_id                  = var.tenant_id
  sku_name                   = "standard"
  purge_protection_enabled   = false
  rbac_authorization_enabled = true
  soft_delete_retention_days = 7

}