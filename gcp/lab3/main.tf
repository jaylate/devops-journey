provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_container_cluster" "cluster" {
  name     = "gke-cluster"
  location = var.region
  project  = var.project_id

  enable_autopilot = true

  network    = "default"
  subnetwork = "default"

  release_channel {
    channel = "REGULAR"
  }

  deletion_protection = false
}
