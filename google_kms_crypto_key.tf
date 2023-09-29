resource "google_kms_crypto_key" "secrets" {
  name            = "crypto-key-${random_id.random_kms_suffix.hex}s"
  key_ring        = var.key_ring_id
  rotation_period = "7776000s"
  lifecycle {
    prevent_destroy = true
  }
}

resource "random_id" "random_kms_suffix" {
  byte_length = 4
}
