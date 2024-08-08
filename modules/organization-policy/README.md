## organization-policy
Create organization read policy and attach service account.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 5.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 5.0 |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_iam_custom_role.cloudbase_organization_custom_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_custom_role) | resource |
| [google_project_iam_member.bind_cloudbase_organization_custom_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [random_string.unique_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudbase_organization_role_permissions"></a> [cloudbase\_organization\_role\_permissions](#input\_cloudbase\_organization\_role\_permissions) | (require) The list of permissions for read organization | `list(string)` | <pre>[<br>  "iam.roles.list",<br>  "orgpolicy.policy.get",<br>  "resourcemanager.folders.get",<br>  "resourcemanager.folders.getIamPolicy",<br>  "resourcemanager.folders.list",<br>  "resourcemanager.hierarchyNodes.listTagBindings",<br>  "resourcemanager.organizations.get",<br>  "resourcemanager.organizations.getIamPolicy",<br>  "resourcemanager.resourceTagBindings.list",<br>  "resourcemanager.tagKeys.get",<br>  "resourcemanager.tagKeys.getIamPolicy",<br>  "resourcemanager.tagKeys.list",<br>  "resourcemanager.tagValues.get",<br>  "resourcemanager.tagValues.getIamPolicy",<br>  "resourcemanager.tagValues.list"<br>]</pre> | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | (required) The Google Cloud Platform project ID | `string` | n/a | yes |
| <a name="input_sa_email"></a> [sa\_email](#input\_sa\_email) | (required) The Service Account email | `string` | n/a | yes |

## Outputs

No outputs.
