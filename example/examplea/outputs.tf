

output "secret_names" {
  value       = module.secret-manager.secret_names
  description = "List of secret names"
  sensitive   = true
}

output "secret_versions" {
  value       = module.secret-manager.secret_versions
  description = "List of secret versions"
  sensitive   = true
}
