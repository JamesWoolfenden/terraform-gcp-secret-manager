
resource "google_pubsub_topic_iam_member" "publisher" {
  role   = "roles/pubsub.publisher"
  member = "serviceAccount:${google_project_service_identity.secretmanager.email}"
  topic  = google_pubsub_topic.secret.name
}