variable "cloudbase_organization_role_permissions" {
  type        = list(string)
  description = "(require) The list of permissions for read organization"
  default = [
    "iam.roles.list",
    "orgpolicy.policy.get",
    "resourcemanager.folders.get",
    "resourcemanager.folders.getIamPolicy",
    "resourcemanager.folders.list",
    "resourcemanager.hierarchyNodes.listTagBindings",
    "resourcemanager.organizations.get",
    "resourcemanager.organizations.getIamPolicy",
    "resourcemanager.resourceTagBindings.list",
    "resourcemanager.tagKeys.get",
    "resourcemanager.tagKeys.getIamPolicy",
    "resourcemanager.tagKeys.list",
    "resourcemanager.tagValues.get",
    "resourcemanager.tagValues.getIamPolicy",
    "resourcemanager.tagValues.list",
  ]
}

variable "project_id" {
  description = "(required) The Google Cloud Platform project ID"
  type        = string
}

variable "sa_email" {
  description = "(required) The Service Account email"
  type        = string
  varidaion {
    condition     = can(regex("^[a-z0-9._%+-]+@[a-z0-9.-]+.iam.gserviceaccount.com$", var.sa_email))
    error_message = "Invalid syntax for Service Account email"
  }
}
