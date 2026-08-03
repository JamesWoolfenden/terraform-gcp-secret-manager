# holden:ignore:HLD_GCP_019 — labels applied via provider default_labels
resource "google_kms_crypto_key" "secrets" {
  name            = "crypto-key-${random_id.random_kms_suffix.hex}"
  key_ring        = var.key_ring_id
  rotation_period = var.kms_rotation_period
  lifecycle {
    prevent_destroy = true
  }
}

resource "random_id" "random_kms_suffix" {
  byte_length = 4
}
