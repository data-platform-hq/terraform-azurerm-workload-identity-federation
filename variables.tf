variable "location" {
  type        = string
  description = "Azure Region"
}

variable "resource_group" {
  description = "The name of the resource group"
  type        = string
}

variable "ado_workload_identity_federation_enabled" {
  description = "Workload Identity Federation enable"
  default     = true
}

variable "role_assignments_allowed" {
  description = "This variable determines whether Service Principal used by Terraform can assign Roles to Azure resources"
  default     = true
}

variable "user_assigned_identity_name" {
  type        = string
  description = "Specifies the name of the User Assigned Identity"
}

variable "custom_serviceendpoint_name" {
  type        = string
  description = "Specifies the name of the ADO Service Connection"
  default     = ""
}

variable "custom_federated_identity_credential_name" {
  type        = string
  description = "Specifies the name of the Federated Identity Credential"
  default     = ""
}

variable "ado_project_name" {
  type        = string
  description = "ADO Project Name"
}

variable "role_assignment_scope" {
  type        = string
  description = "ADO Service Connection target Subscription Id"
}

variable "subscription_id" {
  type        = string
  description = "ADO Service Connection target Subscription Id"
}

variable "tenant_id" {
  type        = string
  description = "ADO Service Connection target Tenant Id"
}

variable "key_vault_policy_config" {
  description = "List of object with parameters to create Key Vault Access Policy"
  type = list(object({
    key_vault_name     = string
    key_vault_id       = string
    tenant_id          = string
    key_permissions    = optional(list(string), ["Get", "List", "Encrypt", "Decrypt"])
    secret_permissions = optional(list(string), ["Get", "List"])
  }))
  default = []
}
