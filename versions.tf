terraform {
  required_providers {
    google = "~> 3.90"
    google-beta = "~> 3.90"
    random = "~> 3.1"
  }
}
provider "google" {}
provider "random" {}

provider "google-beta" {
  project = var.project_id
}
