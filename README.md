# terraform-google-cloudbase

Terraform module for Cloudbase on GCP.

## Usage
`project-policy`:
```
module "cloudbase" {
  source  = "Levetty/cloudbase/google//modules/project-policy"
  version = "0.7.0"

  project_id = "xxx" # required

  enable_all_apis = true # optional: if true, terraform will enable all apis for scanning

  cloudbase_role_permissions = [
  ] # optional: if you want to custom role permissions, you can specify by this variable
}
```
