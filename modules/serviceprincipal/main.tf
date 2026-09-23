resource "azuread_application" "app" {
  display_name = var.application_name
}

resource "azuread_service_principal" "sp" {
  client_id = azuread_application.app.client_id
}

resource "azuread_service_principal_password" "sp_password" {
  display_name         = "${var.application_name}-secret"
  service_principal_id = azuread_service_principal.sp.id
}
