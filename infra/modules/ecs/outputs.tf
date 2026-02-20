output "cluster_id" {
  description = "ID do cluster ECS"
  value       = aws_ecs_cluster.this.id
}

output "cluster_name" {
  description = "Nome do cluster ECS"
  value       = aws_ecs_cluster.this.name
}

output "service_name" {
  description = "Nome do servico ECS"
  value       = aws_ecs_service.this.name
}

output "task_definition_arn" {
  description = "ARN da task definition"
  value       = aws_ecs_task_definition.this.arn
}

output "service_security_group_id" {
  description = "Security group do servico ECS"
  value       = aws_security_group.service.id
}
