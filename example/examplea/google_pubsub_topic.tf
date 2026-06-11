resource "google_pubsub_topic" "secret" {
  name                       = "topic"
  kms_key_name               = google_kms_crypto_key.pubsub.id
  message_retention_duration = "604800s"
}
