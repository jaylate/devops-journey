provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

module "vpc" {
  source  = "terraform-google-modules/network/google//modules/vpc"
  version = "~> 16.1"

  project_id = var.project

  network_name = "terraform-network"
  # Required when subnets are not defined explicitly
  # Otherwise, the VPC is created in custom subnet mode
  auto_create_subnetworks = true
}

module "instance_template" {
  source  = "terraform-google-modules/vm/google//modules/instance_template"
  version = "~> 15.0"

  project_id = var.project
  region     = var.region

  machine_type = "e2-micro"
  tags         = ["web"]

  # Equivalent to "debian-cloud/debian-13"
  source_image_project = "debian-cloud"
  source_image_family  = "debian-13"

  metadata = {
    startup-script = file("${path.module}/startup.sh")
  }

  network = module.vpc.network_name
  # If nat_ip is not set, the VM gets an ephemeral external IP
  access_config = [{
    network_tier = "PREMIUM"
  }]
}

module "compute_instance" {
  source  = "terraform-google-modules/vm/google//modules/compute_instance"
  version = "~> 15.0"

  project_id = var.project
  region     = var.region
  zone       = var.zone
  hostname   = "terraform-instance"

  # This module requires an instance template because it creates a google_compute_instance_from_template resource internally
  instance_template = module.instance_template.self_link
}

module "firewall_rules" {
  source  = "terraform-google-modules/network/google//modules/firewall-rules"
  version = "~> 16.1"

  project_id   = var.project
  network_name = module.vpc.network_name

  rules = [
    {
      name          = "allow-icmp-ingress"
      direction     = "INGRESS"
      source_ranges = ["0.0.0.0/0"]
      target_tags   = ["web"]
      allow = [{
        protocol = "icmp"
      }]
    },
    {
      name          = "allow-ssh-ingress"
      direction     = "INGRESS"
      source_ranges = ["0.0.0.0/0"]
      target_tags   = ["web"]
      allow = [{
        protocol = "tcp"
        ports    = ["22"]
      }]
    },
    {
      name          = "allow-http-ingress"
      direction     = "INGRESS"
      source_ranges = ["0.0.0.0/0"]
      target_tags   = ["web"]
      allow = [{
        protocol = "tcp"
        ports    = ["80"]
      }]
    }
  ]
}
