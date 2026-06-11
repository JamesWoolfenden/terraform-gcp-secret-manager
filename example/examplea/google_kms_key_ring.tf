resource "google_kms_key_ring" "secret" {
  name     = "key-ring"
  location = "us-central1"
}
