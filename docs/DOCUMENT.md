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
| [google_project_iam_custom_role.cloudbase_project_custom_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_custom_role) | resource |
| [google_project_iam_member.bind_cloudbase_custom_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.bind_security_admin_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.bind_viewer_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.optional](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.cloudbase_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [random_string.unique_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudbase_role_permissions"></a> [cloudbase\_role\_permissions](#input\_cloudbase\_role\_permissions) | (require) The list of permissions for the default role | `list(string)` | <pre>[<br>  "artifactregistry.dockerimages.list",<br>  "artifactregistry.locations.list",<br>  "artifactregistry.packages.list",<br>  "artifactregistry.repositories.downloadArtifacts",<br>  "artifactregistry.repositories.list",<br>  "cloudasset.assets.listResource",<br>  "cloudasset.assets.searchAllIamPolicies",<br>  "cloudfunctions.functions.list",<br>  "cloudfunctions.functions.sourceCodeGet",<br>  "cloudfunctions.locations.list",<br>  "cloudkms.cryptoKeys.list",<br>  "cloudkms.keyRings.getIamPolicy",<br>  "cloudkms.keyRings.list",<br>  "cloudsql.instances.list",<br>  "cloudsql.users.list",<br>  "compute.autoscalers.list",<br>  "compute.backendServices.list",<br>  "compute.disks.list",<br>  "compute.firewalls.list",<br>  "compute.forwardingRules.list",<br>  "compute.globalNetworkEndpointGroups.get",<br>  "compute.globalNetworkEndpointGroups.list",<br>  "compute.healthChecks.list",<br>  "compute.images.list",<br>  "compute.instanceGroups.get",<br>  "compute.instanceGroups.list",<br>  "compute.instances.getIamPolicy",<br>  "compute.instances.list",<br>  "compute.instanceTemplates.list",<br>  "compute.networkEndpointGroups.get",<br>  "compute.networkEndpointGroups.list",<br>  "compute.networks.list",<br>  "compute.projects.get",<br>  "compute.regionNetworkEndpointGroups.get",<br>  "compute.regionNetworkEndpointGroups.list",<br>  "compute.regions.list",<br>  "compute.resourcePolicies.list",<br>  "compute.routes.list",<br>  "compute.securityPolicies.list",<br>  "compute.snapshots.list",<br>  "compute.sslPolicies.list",<br>  "compute.subnetworks.list",<br>  "compute.targetHttpProxies.list",<br>  "compute.targetHttpsProxies.list",<br>  "compute.targetPools.list",<br>  "compute.targetSslProxies.list",<br>  "compute.targetTcpProxies.list",<br>  "compute.urlMaps.list",<br>  "container.clusters.list",<br>  "deploymentmanager.deployments.list",<br>  "dns.managedZones.list",<br>  "iam.denypolicies.list",<br>  "iam.roles.list",<br>  "iam.serviceAccountKeys.list",<br>  "iam.serviceAccounts.list",<br>  "logging.logMetrics.list",<br>  "logging.sinks.list",<br>  "monitoring.alertPolicies.list",<br>  "pubsub.subscriptions.list",<br>  "pubsub.topics.list",<br>  "resourcemanager.hierarchyNodes.listTagBindings",<br>  "resourcemanager.projects.get",<br>  "resourcemanager.projects.getIamPolicy",<br>  "resourcemanager.resourceTagBindings.list",<br>  "run.locations.list",<br>  "run.services.getIamPolicy",<br>  "run.services.list",<br>  "serviceusage.services.list",<br>  "storage.buckets.getIamPolicy",<br>  "storage.buckets.list"<br>]</pre> | no |
| <a name="input_enable_all_apis"></a> [enable\_all\_apis](#input\_enable\_all\_apis) | (optional) Allow access all APIs | `bool` | `false` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | (required) The Google Cloud Platform project ID | `string` | n/a | yes |

## Outputs

No outputs.
