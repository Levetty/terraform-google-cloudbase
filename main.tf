resource "random_string" "unique_id" {
  length    = 5
  min_lower = 5
  special   = false
}

resource "google_service_account" "cloudbase_service_account" {
  account_id   = "cloudbase-sa-${random_string.unique_id.result}"
  display_name = "Cloudbase Service Account"
  project      = var.project_id
}

resource "google_project_iam_custom_role" "cloudbase_project_custom_role" {
  project     = var.project_id
  role_id     = "cloudbaseViewer${random_string.unique_id.result}"
  title       = "Cloudbase Viewer ${random_string.unique_id.result}"
  permissions = var.cloudbase_role_permissions
}

resource "google_project_iam_member" "bind_viewer_role" {
  project = var.project_id
  role    = "roles/viewer"
  member  = "serviceAccount:${google_service_account.cloudbase_service_account.email}"
}

resource "google_project_iam_member" "bind_security_admin_role" {
  project = var.project_id
  role    = "roles/compute.securityAdmin"
  member  = "serviceAccount:${google_service_account.cloudbase_service_account.email}"
}

resource "google_project_iam_member" "bind_cloudbase_custom_role" {
  project = var.project_id
  role    = "projects/${var.project_id}/roles/${google_project_iam_custom_role.cloudbase_project_custom_role.role_id}"
  member  = "serviceAccount:${google_service_account.cloudbase_service_account.email}"
}

###################
# Enable Services
###################
locals {
  is_enable_all = var.enable_all_apis ? [
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
  ] : []
}

resource "google_project_service" "optional" {
  for_each           = toset(local.is_enable_all)
  project            = var.project_id
  service            = each.key
  disable_on_destroy = false
}
