resource "random_string" "unique_id" {
  length    = 5
  min_lower = 5
  special   = false
}

resource "google_project_iam_custom_role" "cloudbase_organization_custom_role" {
  project     = var.project_id
  role_id     = "cloudbaseOrganizationViewer${random_string.unique_id.result}"
  title       = "Cloudbase Organization Viewer ${random_string.unique_id.result}"
  permissions = var.cloudbase_organization_role_permissions
}

resource "google_project_iam_member" "bind_cloudbase_organization_custom_role" {
  project = var.project_id
  role    = "projects/${var.project_id}/roles/${google_project_iam_custom_role.cloudbase_organization_custom_role.role_id}"
  member  = "serviceAccount:${var.sa_email}"
}
