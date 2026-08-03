output "secret_ids" {
  description = "Map of secret name to google_secret_manager_secret resource ID"
  value       = { for k, v in google_secret_manager_secret.secrets : k => v.id }
  sensitive   = true
}

output "secret_version_ids" {
  description = "Map of secret name to google_secret_manager_secret_version resource ID"
  value       = { for k, v in google_secret_manager_secret_version.this : k => v.id }
  sensitive   = true
}

output "kms_key_id" {
  description = "ID of the KMS crypto key used to encrypt the secrets"
  value       = google_kms_crypto_key.secrets.id
  sensitive   = true
}

output "service_account_email" {
  description = "Email of the Secret Manager service identity used for CMEK and Pub/Sub publishing"
  value       = google_project_service_identity.secretmanager.email
}
