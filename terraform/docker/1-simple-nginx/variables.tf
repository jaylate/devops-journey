variable "container_name" {
  description = "The name of container to be made"
  type        = string
  default     = "simple-nginx"
}

variable "container_external_port" {
  type    = number
  default = 8080
}
