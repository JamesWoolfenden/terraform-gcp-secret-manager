resource "google_kms_crypto_key" "pubsub" {
  name            = "crypto-key-${random_id.random_kms_suffix.hex}s"
  key_ring        = google_kms_key_ring.key_ring.name
  rotation_period = "7776000s"
  lifecycle {
    prevent_destroy = true
  }
}

resource "random_id" "random_kms_suffix" {
  byte_length = 4
}
