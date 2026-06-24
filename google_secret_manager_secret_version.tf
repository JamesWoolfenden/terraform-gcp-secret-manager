resource "google_secret_manager_secret_version" "this" {
  for_each    = local.secret_names
  secret      = google_secret_manager_secret.secrets[each.value].id
  secret_data = local.secret_data_map[each.value]
}
