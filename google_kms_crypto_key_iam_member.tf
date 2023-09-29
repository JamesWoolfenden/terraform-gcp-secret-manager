
resource "google_kms_crypto_key_iam_member" "encrypter_decrypter" {
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:${google_project_service_identity.secretmanager.email}"
  crypto_key_id = google_kms_crypto_key.secrets.id
}
