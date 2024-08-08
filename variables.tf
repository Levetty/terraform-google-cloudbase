variable "project_id" {
  description = "(required) The Google Cloud Platform project ID"
  type        = string
}

variable "enable_all_apis" {
  default     = false
  description = "(optional) Allow access all APIs"
  type        = bool
}

variable "cloudbase_role_permissions" {
  type        = list(string)
  description = "(require) The list of permissions for the default role"
  default = [
    "artifactregistry.dockerimages.list",
    "artifactregistry.locations.list",
    "artifactregistry.packages.list",
    "artifactregistry.repositories.downloadArtifacts",
    "artifactregistry.repositories.list",
    "cloudasset.assets.listResource",
    "cloudasset.assets.searchAllIamPolicies",
    "cloudfunctions.functions.list",
    "cloudfunctions.functions.sourceCodeGet",
    "cloudfunctions.locations.list",
    "cloudkms.cryptoKeys.list",
    "cloudkms.keyRings.getIamPolicy",
    "cloudkms.keyRings.list",
    "cloudsql.instances.list",
    "cloudsql.users.list",
    "compute.autoscalers.list",
    "compute.backendServices.list",
    "compute.disks.list",
    "compute.firewalls.list",
    "compute.forwardingRules.list",
    "compute.globalNetworkEndpointGroups.get",
    "compute.globalNetworkEndpointGroups.list",
    "compute.healthChecks.list",
    "compute.images.list",
    "compute.instanceGroups.get",
    "compute.instanceGroups.list",
    "compute.instances.getIamPolicy",
    "compute.instances.list",
    "compute.instanceTemplates.list",
    "compute.networkEndpointGroups.get",
    "compute.networkEndpointGroups.list",
    "compute.networks.list",
    "compute.projects.get",
    "compute.regionNetworkEndpointGroups.get",
    "compute.regionNetworkEndpointGroups.list",
    "compute.regions.list",
    "compute.resourcePolicies.list",
    "compute.routes.list",
    "compute.securityPolicies.list",
    "compute.snapshots.list",
    "compute.sslPolicies.list",
    "compute.subnetworks.list",
    "compute.targetHttpProxies.list",
    "compute.targetHttpsProxies.list",
    "compute.targetPools.list",
    "compute.targetSslProxies.list",
    "compute.targetTcpProxies.list",
    "compute.urlMaps.list",
    "container.clusters.list",
    "deploymentmanager.deployments.list",
    "dns.managedZones.list",
    "iam.denypolicies.list",
    "iam.roles.list",
    "iam.serviceAccountKeys.list",
    "iam.serviceAccounts.list",
    "logging.logMetrics.list",
    "logging.sinks.list",
    "monitoring.alertPolicies.list",
    "pubsub.subscriptions.list",
    "pubsub.topics.list",
    "resourcemanager.hierarchyNodes.listTagBindings",
    "resourcemanager.projects.get",
    "resourcemanager.projects.getIamPolicy",
    "resourcemanager.resourceTagBindings.list",
    "run.locations.list",
    "run.services.getIamPolicy",
    "run.services.list",
    "serviceusage.services.list",
    "storage.buckets.getIamPolicy",
    "storage.buckets.list",
  ]
}
