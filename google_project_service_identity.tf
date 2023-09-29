
resource "google_project_service_identity" "secretmanager" {
  provider = google-beta
  service  = "secretmanager.googleapis.com"
}
