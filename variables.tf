variable "project_id" {
  type = string
}

variable "enable_all_apis" {
  default = false
}

variable "cloudbase_role_permissions" {
  type = list(string)
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
    "storage.buckets.list"
  ]
}
