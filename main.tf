resource "google_secret_manager_secret" "secret" {
  secret_id = var.name

  labels = {
    github_org = var.github_org
    repo       = var.repo_name
    project    = var.project_id
  }

  # Automatic replication stores the secret at location "global", which projects
  # under an org policy restricting resource locations reject at create. Setting
  # replication_locations pins the replicas to named regions instead.
  replication {
    dynamic "auto" {
      for_each = length(var.replication_locations) == 0 ? [1] : []
      content {}
    }

    dynamic "user_managed" {
      for_each = length(var.replication_locations) > 0 ? [1] : []
      content {
        dynamic "replicas" {
          for_each = var.replication_locations
          content {
            location = replicas.value
          }
        }
      }
    }
  }
}

resource "google_secret_manager_secret_version" "secret_version" {
  secret      = google_secret_manager_secret.secret.id
  secret_data = var.value
}
