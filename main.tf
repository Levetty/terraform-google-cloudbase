resource "random_string" "unique_id" {
  length = 5
  min_lower = 5
  special = false
}

resource "google_service_account" "cloudbase_service_account" {
  account_id = "cloudbase-sa-${random_string.unique_id.result}"
  display_name = "Cloudbase Service Account"
  project = var.project_id
}

resource "google_project_iam_custom_role" "cloudbase_project_custom_role" {
  project = var.project_id
  role_id = "cloudbaseViewer${random_string.unique_id.result}"
  title = "Cloudbase Viewer ${random_string.unique_id.result}"
  permissions = var.cloudbase_role_permissions
}

resource "google_project_iam_member" "bind_viewer_role" {
  project = var.project_id
  role = "roles/viewer"
  member = "serviceAccount:${google_service_account.cloudbase_service_account.email}"
}

resource "google_project_iam_member" "bind_security_admin_role" {
  project = var.project_id
  role = "roles/compute.securityAdmin"
  member = "serviceAccount:${google_service_account.cloudbase_service_account.email}"
}

resource "google_project_iam_member" "bind_cloudbase_custom_role" {
  project = var.project_id
  role = "projects/${var.project_id}/roles/${google_project_iam_custom_role.cloudbase_project_custom_role.role_id}"
  member = "serviceAccount:${google_service_account.cloudbase_service_account.email}"
}

###################
# Enable Services
###################
resource "google_project_service" "enable_dns" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "dns.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_bigquery" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "bigquery.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_cloudkms" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "cloudkms.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_cloudresourcemanager" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_monitoring" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "monitoring.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_logging" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "logging.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_container" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "container.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_iam" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "iam.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_storage_component" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "storage-component.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_sql_component" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "sql-component.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_service_compute" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "compute.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_redis" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "redis.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_cloudfunctions" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "cloudfunctions.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_recommender" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "recommender.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_dataproc" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "dataproc.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_bigtableadmin" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "bigtableadmin.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_serviceusage" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "serviceusage.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_appengine" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "appengine.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_run" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "run.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_pubsub" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "pubsub.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_spanner" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "spanner.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_sourcerepo" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "sourcerepo.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_websecurityscanner" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "websecurityscanner.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_binaryauth" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "binaryauthorization.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_cloudtask" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "cloudtasks.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_secretmanager" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "secretmanager.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_healthcare" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "healthcare.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_filestore" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "file.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_cloud_asset_inventory" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "cloudasset.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_firebaserules" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "firebaserules.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_composer" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "composer.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_containeranalysis" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "containeranalysis.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_ml" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "ml.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_apigateway" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "apigateway.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_datafusion" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "datafusion.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_apikey" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "apikeys.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_identityawareproxy" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "iap.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_certificateauthorityservice" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "privateca.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_accessapproval" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "accessapproval.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_essentialcontacts" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "essentialcontacts.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_servicedirectory" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "servicedirectory.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_orgpolicy" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "orgpolicy.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_managedidentities" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "managedidentities.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_datacatalog" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "datacatalog.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "enable_securitycenter" {
  count = var.enable_all_apis ? 1 : 0
  project = var.project_id
  service = "securitycenter.googleapis.com"
  disable_on_destroy = false
}
