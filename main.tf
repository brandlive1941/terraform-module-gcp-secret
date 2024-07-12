resource "google_secret_manager_secret" "secret" {
  secret_id = var.name

  labels = {
    github_org = var.github_org
    repo       = var.repo_name
    project    = var.project_id
  }

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "secret_version" {
  secret      = google_secret_manager_secret.secret.id
  secret_data = var.value
}

