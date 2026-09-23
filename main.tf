#Using the custom created Service Principal Module

module "service_principal" {
  source           = "./modules/serviceprincipal"
  application_name = var.application_name
}