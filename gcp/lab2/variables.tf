variable "project" {
  type        = string
  description = "Specify your Project ID"
}

variable "region" {
  type        = string
  description = "Specify desired default region"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "Specify desired default zone"
  default     = "us-central1-c"
}

variable "repository" {
  type        = string
  description = "Artifact Registry repository name"
  default     = "devops-journey-repository"
}
