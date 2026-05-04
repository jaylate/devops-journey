output "gke_get_creds" {
  value = "gcloud container clusters get-credentials ${google_container_cluster.cluster.name} --location ${google_container_cluster.cluster.location} --project ${var.project_id}"
}
