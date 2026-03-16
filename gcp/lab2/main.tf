provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

# Reference information about the image in one place
data "google_artifact_registry_docker_image" "app_image" {
  location      = var.region
  repository_id = var.repository
  image_name    = "simple-go-app"
}

# Cloud Run resource will receive dedicated Service Account for least privilage
resource "google_service_account" "cloud_run_sa" {
  account_id   = "simple-go-app-sa"
  display_name = "Service Account for Simple Go App"
  description  = "Runs the Cloud Run service"
}

resource "google_cloud_run_v2_service" "cloud_run" {
  name                = "simple-go-app"
  location            = var.region
  deletion_protection = false
  ingress             = "INGRESS_TRAFFIC_ALL"

  scaling {
    min_instance_count = 0
    max_instance_count = 1
  }

  template {
    service_account = google_service_account.cloud_run_sa.email
    containers {
      image = data.google_artifact_registry_docker_image.app_image.self_link
    }
  }
}

# Allow access to the app for anyone on the internet
resource "google_cloud_run_v2_service_iam_member" "allUsers" {
  name     = google_cloud_run_v2_service.cloud_run.name
  location = google_cloud_run_v2_service.cloud_run.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}
