variable "name_prefix" {
  description = "Prefixo para nomeacao dos recursos"
  type        = string
}

variable "vpc_id" {
  description = "ID do VPC"
  type        = string
}

variable "private_subnet_ids" {
  description = "Subnets privadas para tasks ECS"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security group do ALB"
  type        = string
}

variable "target_group_arn" {
  description = "ARN do target group do ALB"
  type        = string
}

variable "container_name" {
  description = "Nome do container"
  type        = string
  default     = "app"
}

variable "container_image" {
  description = "Imagem do container"
  type        = string
}

variable "container_port" {
  description = "Porta exposta pelo container"
  type        = number
  default     = 8080
}

variable "container_environment" {
  description = "Variaveis de ambiente do container"
  type        = map(string)
  default     = {}
}

variable "task_cpu" {
  description = "CPU da task Fargate"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Memoria da task Fargate"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "Quantidade desejada de tasks"
  type        = number
  default     = 1
}

variable "log_retention_in_days" {
  description = "Retencao dos logs no CloudWatch"
  type        = number
  default     = 14
}

variable "tags" {
  description = "Tags comuns"
  type        = map(string)
  default     = {}
}
