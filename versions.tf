terraform {
  required_providers {
    google      = "~> 4.0"
    google-beta = "~> 4.0"
    random      = "~> 3.1"
  }
}

provider "google-beta" {
  project = var.project_id
}
