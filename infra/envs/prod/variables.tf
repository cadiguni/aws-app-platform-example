variable "project_name" {
  description = "Nome base do projeto"
  type        = string
}

variable "environment" {
  description = "Ambiente"
  type        = string
  default     = "prod"
}

variable "aws_region" {
  description = "Regiao AWS"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR do VPC"
  type        = string
  default     = "10.30.0.0/16"
}

variable "az_count" {
  description = "Quantidade de AZs"
  type        = number
  default     = 2
}

variable "single_nat_gateway" {
  description = "Se true, usa apenas um NAT Gateway"
  type        = bool
  default     = false
}

variable "alb_listener_port" {
  description = "Porta do listener do ALB"
  type        = number
  default     = 80
}

variable "alb_ingress_cidr_blocks" {
  description = "CIDRs liberados para o ALB"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "alb_internal" {
  description = "Se true, cria ALB interno"
  type        = bool
  default     = false
}

variable "health_check_path" {
  description = "Path de health check"
  type        = string
  default     = "/health"
}

variable "container_name" {
  description = "Nome do container"
  type        = string
  default     = "api"
}

variable "container_image" {
  description = "Imagem da aplicacao"
  type        = string
}

variable "app_port" {
  description = "Porta da aplicacao"
  type        = number
  default     = 8080
}

variable "container_environment" {
  description = "Variaveis de ambiente do container"
  type        = map(string)
  default     = {}
}

variable "task_cpu" {
  description = "CPU da task ECS"
  type        = number
  default     = 512
}

variable "task_memory" {
  description = "Memoria da task ECS"
  type        = number
  default     = 1024
}

variable "desired_count" {
  description = "Numero desejado de tarefas"
  type        = number
  default     = 2
}

variable "log_retention_in_days" {
  description = "Retencao de logs no CloudWatch"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags comuns"
  type        = map(string)
  default = {
    managed_by = "terraform"
    env        = "prod"
  }
}
