
output "secret_names" {
  value = concat(
    values({ for k, v in google_secret_manager_secret.secrets : k => v.name }),
  )

  description = "The name list of Secrets"
}

output "secret_versions" {
  value = concat(
    values({ for k, v in google_secret_manager_secret_version.secret-version : k => v.name }),
  )

  description = "The name list of Secret Versions"
}
