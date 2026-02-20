variable "name_prefix" {
  description = "Prefixo para nomeacao dos recursos"
  type        = string
}

variable "vpc_id" {
  description = "ID do VPC"
  type        = string
}

variable "private_subnet_ids" {
  description = "Subnets privadas para o DB subnet group"
  type        = list(string)
}

variable "allowed_security_group_ids" {
  description = "Security groups com acesso permitido ao banco"
  type        = list(string)
  default     = []
}

variable "allowed_cidr_blocks" {
  description = "CIDRs com acesso permitido ao banco"
  type        = list(string)
  default     = []
}

variable "db_name" {
  description = "Nome do banco"
  type        = string
}

variable "db_username" {
  description = "Usuario master do banco"
  type        = string
  default     = "app_user"
}

variable "db_port" {
  description = "Porta do Postgres"
  type        = number
  default     = 5432
}

variable "engine_version" {
  description = "Versao do Postgres"
  type        = string
  default     = "16.4"
}

variable "instance_class" {
  description = "Classe da instancia RDS"
  type        = string
  default     = "db.t4g.micro"
}

variable "allocated_storage" {
  description = "Storage inicial (GB)"
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "Storage maximo para autoscaling (GB)"
  type        = number
  default     = 100
}

variable "backup_retention_period" {
  description = "Dias de retencao de backup"
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "Janela de backup"
  type        = string
  default     = "03:00-04:00"
}

variable "maintenance_window" {
  description = "Janela de manutencao"
  type        = string
  default     = "sun:05:00-sun:06:00"
}

variable "multi_az" {
  description = "Habilita deployment Multi-AZ"
  type        = bool
  default     = false
}

variable "deletion_protection" {
  description = "Habilita protection contra delete"
  type        = bool
  default     = true
}

variable "skip_final_snapshot" {
  description = "Se true, remove sem snapshot final"
  type        = bool
  default     = false
}

variable "performance_insights_enabled" {
  description = "Habilita Performance Insights"
  type        = bool
  default     = true
}

variable "apply_immediately" {
  description = "Aplica mudancas sem aguardar maintenance window"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags comuns"
  type        = map(string)
  default     = {}
}

