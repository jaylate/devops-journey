terraform {
  required_version = ">=1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.23.0"
    }
  }
  backend "gcs" {
    bucket = "devops-journey-state-storage"
    prefix = "lab2"
  }
}
