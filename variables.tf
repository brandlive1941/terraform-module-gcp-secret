variable "project_id" {
  description = "GCP Project Id"
  type        = string
}

variable "github_org" {
  description = "Github Organization"
  type        = string
}

variable "repo_name" {
  description = "Repository Name"
  type        = string
}

variable "name" {
  description = "secret name"
  type        = string
}

variable "value" {
  description = "secret value"
  type        = string
}

variable "replication_locations" {
  description = "Regions to replicate the secret to. Empty (the default) uses automatic replication, which stores the secret globally."
  type        = list(string)
  default     = []
}
