output "api_name" {
  description = "Nome logico da API"
  value       = local.api_name
}

output "environment" {
  description = "Ambiente atual"
  value       = var.environment
}
