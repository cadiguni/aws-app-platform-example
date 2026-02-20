variable "project_name" {
  description = "Nome base do projeto"
  type        = string
}

variable "environment" {
  description = "Ambiente"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "Regiao AWS"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR do VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "az_count" {
  description = "Quantidade de AZs"
  type        = number
  default     = 2
}

variable "single_nat_gateway" {
  description = "Se true, usa apenas um NAT Gateway"
  type        = bool
  default     = true
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
  default     = 256
}

variable "task_memory" {
  description = "Memoria da task ECS"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "Numero desejado de tarefas"
  type        = number
  default     = 1
}

variable "log_retention_in_days" {
  description = "Retencao de logs no CloudWatch"
  type        = number
  default     = 14
}

variable "db_name" {
  description = "Nome do banco PostgreSQL"
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "Usuario master do banco"
  type        = string
  default     = "app_user"
}

variable "db_port" {
  description = "Porta do PostgreSQL"
  type        = number
  default     = 5432
}

variable "db_engine_version" {
  description = "Versao do PostgreSQL"
  type        = string
  default     = "16.4"
}

variable "db_instance_class" {
  description = "Classe da instancia RDS"
  type        = string
  default     = "db.t4g.micro"
}

variable "db_allocated_storage" {
  description = "Storage inicial do RDS (GB)"
  type        = number
  default     = 20
}

variable "db_max_allocated_storage" {
  description = "Storage maximo do RDS (GB)"
  type        = number
  default     = 100
}

variable "db_backup_retention_period" {
  description = "Dias de retencao de backup do RDS"
  type        = number
  default     = 0
}

variable "db_backup_window" {
  description = "Janela de backup do RDS"
  type        = string
  default     = "03:00-04:00"
}

variable "db_maintenance_window" {
  description = "Janela de manutencao do RDS"
  type        = string
  default     = "sun:05:00-sun:06:00"
}

variable "db_multi_az" {
  description = "Habilita Multi-AZ no RDS"
  type        = bool
  default     = false
}

variable "db_deletion_protection" {
  description = "Habilita protecao contra delete no RDS"
  type        = bool
  default     = false
}

variable "db_skip_final_snapshot" {
  description = "Se true, remove RDS sem snapshot final"
  type        = bool
  default     = true
}

variable "db_performance_insights_enabled" {
  description = "Habilita Performance Insights no RDS"
  type        = bool
  default     = false
}

variable "db_apply_immediately" {
  description = "Aplica mudancas do RDS imediatamente"
  type        = bool
  default     = true
}

variable "rds_allowed_cidr_blocks" {
  description = "CIDRs extras com acesso ao RDS"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags comuns"
  type        = map(string)
  default = {
    managed_by = "terraform"
    env        = "dev"
  }
}
