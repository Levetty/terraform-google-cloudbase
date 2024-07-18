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
  description = "(optional) The list of permissions for the default role"
  default = [
    "cloudasset.assets.listResource",
    "cloudkms.cryptoKeys.list",
    "cloudkms.keyRings.list",
    "cloudsql.instances.list",
    "cloudsql.users.list",
    "compute.autoscalers.list",
    "compute.backendServices.list",
    "compute.disks.list",
    "compute.firewalls.list",
    "compute.healthChecks.list",
    "compute.instanceGroups.list",
    "compute.instances.getIamPolicy",
    "compute.instances.list",
    "compute.networks.list",
    "compute.projects.get",
    "compute.securityPolicies.list",
    "compute.subnetworks.list",
    "compute.targetHttpProxies.list",
    "container.clusters.list",
    "dns.managedZones.list",
    "iam.serviceAccountKeys.list",
    "iam.serviceAccounts.list",
    "logging.logMetrics.list",
    "logging.sinks.list",
    "monitoring.alertPolicies.list",
    "resourcemanager.hierarchyNodes.listTagBindings",
    "resourcemanager.projects.get",
    "resourcemanager.projects.getIamPolicy",
    "resourcemanager.resourceTagBindings.list",
    "storage.buckets.getIamPolicy",
    "storage.buckets.list",
    "artifactregistry.dockerimages.list",
    "artifactregistry.repositories.list",
    "artifactregistry.repositories.downloadArtifacts",
    "compute.snapshots.list",
    "compute.images.list",
    "compute.resourcePolicies.list",
    "deploymentmanager.deployments.list",
    "pubsub.topics.list",
    "compute.instanceTemplates.list",
    "cloudkms.keyRings.getIamPolicy",
    "compute.sslPolicies.list",
    "compute.forwardingRules.list",
    "compute.urlMaps.list",
    "pubsub.subscriptions.list",
    "run.locations.list",
    "run.services.list",
    "run.services.getIamPolicy",
    "cloudfunctions.functions.sourceCodeGet",
    "cloudfunctions.functions.list",
    "cloudfunctions.locations.list",
    "serviceusage.services.list",
  ]
}
