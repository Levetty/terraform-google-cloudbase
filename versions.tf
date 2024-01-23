terraform {
  required_providers {
    google      = "~> 5.0"
    google-beta = "~> 5.0"
    random      = "~> 3.1"
  }
}

provider "google-beta" {
  project = var.project_id
}
