# terraform-google-cloudbase
## Usage
```
module "cloudbase" {
  source  = "Levetty/cloudbase/google"
  version = "0.5.1"

  project_id = "xxx" # required

  enable_all_apis = true # optional: if true, terraform will enable all apis for scanning

  cloudbase_role_permissions = [
  ] # optional: if you want to custom role permissions, you can specify by this variable
}
```
