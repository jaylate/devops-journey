output "external_ip" {
  value     = module.compute_instance.instances_details[0].network_interface[0].access_config[0].nat_ip
  sensitive = true
}
