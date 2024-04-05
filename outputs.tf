output "azurerm_user_assigned_identity_name" {
  description = "Built name of single User Assigned Identity"
  value       = try(azurerm_user_assigned_identity.this.name, null)
}

output "user_assigned_identity_principal_id" {
  description = "Built principal id of single User Assigned Identity"
  value       = try(azurerm_user_assigned_identity.this.principal_id, null)
}
