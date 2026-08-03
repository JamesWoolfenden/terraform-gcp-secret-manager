resource "google_pubsub_topic_iam_member" "publisher" {
  for_each = toset(var.topics)
  role     = "roles/pubsub.publisher"
  member   = "serviceAccount:${google_project_service_identity.secretmanager.email}"
  topic    = each.value
}
