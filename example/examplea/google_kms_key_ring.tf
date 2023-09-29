resource "google_kms_key_ring" "key_ring" {
  name     = "key-ring"
  location = "us-central1"
}
