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
    "accessapproval.googleapis.com",
    "apigateway.googleapis.com",
    "apikeys.googleapis.com",
    "appengine.googleapis.com",
    "bigquery.googleapis.com",
    "bigtableadmin.googleapis.com",
    "binaryauthorization.googleapis.com",
    "cloudasset.googleapis.com",
    "cloudfunctions.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudtasks.googleapis.com",
    "composer.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "containeranalysis.googleapis.com",
    "datacatalog.googleapis.com",
    "datafusion.googleapis.com",
    "dataproc.googleapis.com",
    "dns.googleapis.com",
    "essentialcontacts.googleapis.com",
    "file.googleapis.com",
    "firebaserules.googleapis.com",
    "healthcare.googleapis.com",
    "iam.googleapis.com",
    "iap.googleapis.com",
    "logging.googleapis.com",
    "managedidentities.googleapis.com",
    "ml.googleapis.com",
    "monitoring.googleapis.com",
    "orgpolicy.googleapis.com",
    "privateca.googleapis.com",
    "pubsub.googleapis.com",
    "recommender.googleapis.com",
    "redis.googleapis.com",
    "run.googleapis.com",
    "secretmanager.googleapis.com",
    "securitycenter.googleapis.com",
    "servicedirectory.googleapis.com",
    "serviceusage.googleapis.com",
    "sourcerepo.googleapis.com",
    "spanner.googleapis.com",
    "sql-component.googleapis.com",
    "storage-component.googleapis.com",
    "websecurityscanner.googleapis.com",
  ] : []
}

resource "google_project_service" "optional" {
  for_each           = toset(local.is_enable_all)
  project            = var.project_id
  service            = each.key
  disable_on_destroy = false
}
