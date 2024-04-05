locals {
  key_vault_policy_config_mapped = { for object in var.key_vault_policy_config : object.key_vault_name => object }
}

data "azuredevops_project" "this" {
  name = var.ado_project_name
}

resource "azurerm_user_assigned_identity" "this" {
  name                = var.user_assigned_identity_name
  resource_group_name = var.resource_group
  location            = var.location
}

resource "azuredevops_serviceendpoint_azurerm" "this" {
  count = var.ado_workload_identity_federation_enabled ? 1 : 0

  project_id                             = data.azuredevops_project.this.project_id
  service_endpoint_name                  = coalesce(var.custom_serviceendpoint_name, "federated-(${var.subscription_id})-${var.user_assigned_identity_name}")
  description                            = "Managed by Terraform"
  service_endpoint_authentication_scheme = "WorkloadIdentityFederation"
  credentials {
    serviceprincipalid = azurerm_user_assigned_identity.this.client_id
  }
  azurerm_spn_tenantid      = var.tenant_id
  azurerm_subscription_id   = var.subscription_id
  azurerm_subscription_name = "Example Subscription Name"
}

resource "azurerm_federated_identity_credential" "this" {
  count = var.ado_workload_identity_federation_enabled ? 1 : 0

  name                = coalesce(var.custom_federated_identity_credential_name, "federated-${var.user_assigned_identity_name}")
  resource_group_name = var.resource_group
  parent_id           = azurerm_user_assigned_identity.this.id
  audience            = ["api://AzureADTokenExchange"]
  issuer              = azuredevops_serviceendpoint_azurerm.this[0].workload_identity_federation_issuer
  subject             = azuredevops_serviceendpoint_azurerm.this[0].workload_identity_federation_subject
}


resource "azurerm_role_assignment" "this" {
  count = alltrue([var.ado_workload_identity_federation_enabled, var.role_assignments_allowed]) ? 1 : 0

  principal_id         = azurerm_user_assigned_identity.this.principal_id
  scope                = var.role_assignment_scope
  role_definition_name = "Reader"
}

resource "azurerm_key_vault_access_policy" "assigned_identity" {
  for_each = var.ado_workload_identity_federation_enabled ? local.key_vault_policy_config_mapped : {}

  object_id          = azurerm_user_assigned_identity.this.principal_id
  key_vault_id       = each.value.key_vault_id
  tenant_id          = each.value.tenant_id
  key_permissions    = each.value.key_permissions
  secret_permissions = each.value.secret_permissions
}
