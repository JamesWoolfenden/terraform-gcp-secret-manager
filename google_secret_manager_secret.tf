resource "google_secret_manager_secret" "secrets" {
  for_each  = { for secret in var.secrets : secret.name => secret }
  secret_id = each.value.name

  replication {
    auto {
      customer_managed_encryption {
        kms_key_name = google_kms_crypto_key.secrets.name
      }
    }
  }

  labels = var.labels
  dynamic "topics" {
    for_each = var.topics
    content {
      name = topics.value
    }
  }

  rotation {
    rotation_period = var.rotation_period
  }

  depends_on = [
    google_kms_crypto_key_iam_member.encrypter_decrypter,
    google_pubsub_topic_iam_member.publisher
  ]
}
