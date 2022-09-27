# terraform-gcp-cloudbase-role
## Usage
```
module "cloudbase" {
  source = "xxx" # relative path or registry

  project_id = "xxx" # required

  enable_all_apis = true # optional: if true, terraform will enable all apis for scanning

  cloudbase_role_permissions = [
  ] # optional: if you want to custom role permissions, you can specify by this variable
}
```
