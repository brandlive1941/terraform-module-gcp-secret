output "id" {
  description = "secret id"
  value       = google_secret_manager_secret.secret.secret_id
}

output "value" {
  description = "secret value"
  value       = google_secret_manager_secret_version.secret_version.secret_data
}

output "version" {
  description = "version of the secret"
  value       = google_secret_manager_secret_version.secret_version.name
}