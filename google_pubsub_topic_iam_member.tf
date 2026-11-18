resource "google_pubsub_topic_iam_member" "publisher" {
  # keyed by list index, not topic id: ids of topics created in the same apply are unknown at plan
  for_each = { for i, t in var.topics : tostring(i) => t }
  role     = "roles/pubsub.publisher"
  member   = "serviceAccount:${google_project_service_identity.secretmanager.email}"
  topic    = each.value
}
