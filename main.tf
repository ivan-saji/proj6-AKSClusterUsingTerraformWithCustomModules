data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

#Using the custom created Service Principal Module

module "service_principal" {
  source           = "./modules/serviceprincipal"
  application_name = var.application_name

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_role_assignment" "aks_sp_role" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Contributor"
  principal_id         = module.service_principal.object_id

  depends_on = [module.service_principal]
}

# Call Keyvault module

module "keyvault" {
  source              = "./modules/keyvault"
  keyvault_name       = var.keyvault_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  depends_on = [azurerm_role_assignment.aks_sp_role]
}

#Keyvault secret for Service Principal Client Secret

resource "azurerm_key_vault_secret" "sp_client_secret" {
  name         = "sp-client-secret"
  value        = module.service_principal.client_secret
  key_vault_id = module.keyvault.keyvault_id
}

#Calling AKS Module

module "aks" {
  source              = "./modules/aks"
  aks_name            = var.aks_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix
  node_count          = var.node_count
  vm_size             = var.vm_size

  depends_on = [azurerm_key_vault_secret.sp_client_secret,
  azurerm_role_assignment.aks_sp_role]
}

#Kubeconfig local file

resource "local_file" "kubeconfig" {
  content         = module.aks.kube_config_raw
  filename        = "${path.module}/kubeconfig"
  file_permission = "0600"

  depends_on = [module.aks]
}