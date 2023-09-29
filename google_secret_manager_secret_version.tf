resource "google_secret_manager_secret_version" "secret-version" {
  for_each    = { for secret in var.secrets : secret.name => secret }
  secret      = google_secret_manager_secret.secrets[each.value.name].id
  secret_data = each.value.secret_data
}
