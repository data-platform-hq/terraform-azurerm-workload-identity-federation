# Azure <> Terraform module
Terraform module for creation Azure <>

## Usage

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | =0.11.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | =0.11.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuredevops_serviceendpoint_azurerm.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.11.0/docs/resources/serviceendpoint_azurerm) | resource |
| [azurerm_federated_identity_credential.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/federated_identity_credential) | resource |
| [azurerm_key_vault_access_policy.assigned_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_role_assignment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azuredevops_project.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.11.0/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ado_project_name"></a> [ado\_project\_name](#input\_ado\_project\_name) | ADO Project Name | `string` | n/a | yes |
| <a name="input_ado_workload_identity_federation_enabled"></a> [ado\_workload\_identity\_federation\_enabled](#input\_ado\_workload\_identity\_federation\_enabled) | Workload Identity Federation enable | `bool` | `true` | no |
| <a name="input_custom_federated_identity_credential_name"></a> [custom\_federated\_identity\_credential\_name](#input\_custom\_federated\_identity\_credential\_name) | Specifies the name of the Federated Identity Credential | `string` | `""` | no |
| <a name="input_custom_serviceendpoint_name"></a> [custom\_serviceendpoint\_name](#input\_custom\_serviceendpoint\_name) | Specifies the name of the ADO Service Connection | `string` | `""` | no |
| <a name="input_key_vault_policy_config"></a> [key\_vault\_policy\_config](#input\_key\_vault\_policy\_config) | List of object with parameters to create Key Vault Access Policy | <pre>list(object({<br>    key_vault_name     = string<br>    key_vault_id       = string<br>    tenant_id          = string<br>    key_permissions    = optional(list(string), ["Get", "List", "Encrypt", "Decrypt"])<br>    secret_permissions = optional(list(string), ["Get", "List"])<br>  }))</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure Region | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The name of the resource group | `string` | n/a | yes |
| <a name="input_role_assignment_scope"></a> [role\_assignment\_scope](#input\_role\_assignment\_scope) | ADO Service Connection target Subscription Id | `string` | n/a | yes |
| <a name="input_role_assignments_allowed"></a> [role\_assignments\_allowed](#input\_role\_assignments\_allowed) | This variable determines whether Service Principal used by Terraform can assign Roles to Azure resources | `bool` | `true` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | ADO Service Connection target Subscription Id | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | ADO Service Connection target Tenant Id | `string` | n/a | yes |
| <a name="input_user_assigned_identity_name"></a> [user\_assigned\_identity\_name](#input\_user\_assigned\_identity\_name) | Specifies the name of the User Assigned Identity | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_user_assigned_identity_name"></a> [azurerm\_user\_assigned\_identity\_name](#output\_azurerm\_user\_assigned\_identity\_name) | Built name of single User Assigned Identity |
| <a name="output_user_assigned_identity_principal_id"></a> [user\_assigned\_identity\_principal\_id](#output\_user\_assigned\_identity\_principal\_id) | Built principal id of single User Assigned Identity |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](./LICENSE)
