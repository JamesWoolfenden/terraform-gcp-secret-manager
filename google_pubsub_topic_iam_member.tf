resource "google_pubsub_topic_iam_member" "publisher" {
  count  = length(var.topics)
  role   = "roles/pubsub.publisher"
  member = "serviceAccount:${google_project_service_identity.secretmanager.email}"
  topic  = var.topics[count.index]
}
