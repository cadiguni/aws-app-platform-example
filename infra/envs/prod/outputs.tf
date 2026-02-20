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
