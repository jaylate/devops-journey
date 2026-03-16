output "uri" {
  value       = google_cloud_run_v2_service.cloud_run.uri
  description = "The main URI in which this Service is serving traffic"
}
