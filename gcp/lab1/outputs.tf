output "instance-name" {
  value       = module.compute_instance.instance_name
  description = "Name of the instance"
}

output "zone" {
  value       = module.compute_instance.instances_details[0].zone
  description = "Zone of the instance"
  sensitive   = true
}

output "web_server_url" {
  value       = "http://${module.compute_instance.instances_details[0].network_interface[0].access_config[0].nat_ip}"
  description = "Instance's external IP address"
  sensitive   = true
}
