resource "google_artifact_registry_repository" "my_container_repo" {
  provider      = google-beta # Artifact Registry is currently in beta, so use the beta provider
  location      = "us-central1"
  repository_id = "my-valid-container-repo"
  format        = "DOCKER"

  # Optional: Description for the repository
  description = "My Docker container repository"
}