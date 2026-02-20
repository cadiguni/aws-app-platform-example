output "alb_dns_name" {
  description = "DNS do ALB"
  value       = module.alb.alb_dns_name
}

output "vpc_id" {
  description = "ID do VPC"
  value       = module.network.vpc_id
}

output "ecs_cluster_name" {
  description = "Nome do cluster ECS"
  value       = module.ecs.cluster_name
}

output "ecs_service_name" {
  description = "Nome do servico ECS"
  value       = module.ecs.service_name
}

output "rds_endpoint" {
  description = "Endpoint do RDS"
  value       = module.rds.db_endpoint
}

output "rds_master_secret_arn" {
  description = "ARN do segredo da senha master no Secrets Manager"
  value       = module.rds.master_user_secret_arn
}

output "rds_secure_connection_string" {
  description = "Connection string com password referenciada do Secrets Manager"
  value       = module.rds.secure_connection_string
}
