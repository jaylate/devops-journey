variable "project_id" {
  type        = string
  description = "Specify your Project ID"
}

variable "zone" {
  type        = string
  description = "Specify desired default zone"
  default     = "us-central1-c"
}

variable "image_family" {
  type = string
  description = "Specify image family of prebuilt image"
  default = "my-httpd"
}
