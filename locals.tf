locals {
  # var.secrets is sensitive as a whole; unmark once to derive non-sensitive
  # for_each keys, then re-apply sensitive() to the actual secret value below.
  secrets_unmarked = nonsensitive(var.secrets)
  secret_names     = toset([for secret in local.secrets_unmarked : secret.name])
  secret_data_map  = { for secret in local.secrets_unmarked : secret.name => sensitive(secret.secret_data) }
}
