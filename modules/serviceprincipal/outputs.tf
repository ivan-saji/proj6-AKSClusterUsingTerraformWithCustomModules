output "client_id" {
  description = "The client ID of the created service principal"
  value       = azuread_application.app.client_id
}

output "object_id" {
  description = "The object ID of the created service principal"
  value       = azuread_service_principal.sp.object_id
}

output "client_secret" {
  description = "The client secret of the created service principal"
  value       = azuread_service_principal_password.sp_password.value
  sensitive   = true
}

output "service_principal_tenant_id" {
  value = azuread_service_principal.sp.application_tenant_id
}

output "service_principal_name" {
  description = "The object id of service principal. Can be used to assign roles to user."
  value       = azuread_service_principal.sp.display_name
}