provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_storage_bucket" "state-storage" {
  name     = "devops-journey-state-storage"
  location = "US"

  force_destroy               = false
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}

resource "google_artifact_registry_repository" "repository" {
  location      = var.region
  repository_id = "devops-journey-repository"
  format        = "DOCKER"
}
