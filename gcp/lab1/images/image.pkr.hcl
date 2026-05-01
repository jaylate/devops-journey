packer {
  required_plugins {
    googlecompute = {
      source  = "github.com/hashicorp/googlecompute"
      version = "~> 1"
    }
  }
}

source "googlecompute" "httpd" {
  project_id   = var.project_id
  image_family = var.image_family
  image_name   = "httpd-{{timestamp}}"
  source_image = "debian-13-trixie-v20260428"
  ssh_username = "packer"
  zone         = var.zone

  image_labels = {
    application = "httpd"
    managed_by  = "packer"
  }
}

build {
  sources = ["sources.googlecompute.httpd"]
  provisioner "shell" {
    inline = [
      "sudo apt update",
      "sudo apt install -yq nginx",
      "echo \"<h1>Hello, World!</h1>\" | sudo tee /var/www/html/index.html",
    ]
  }
}
