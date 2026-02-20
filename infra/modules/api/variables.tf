variable "project_name" {
  description = "Nome base do projeto"
  type        = string
}

variable "environment" {
  description = "Ambiente de deploy (dev, prod, etc.)"
  type        = string
}

variable "aws_region" {
  description = "Regiao AWS alvo"
  type        = string
}

variable "tags" {
  description = "Tags comuns para recursos"
  type        = map(string)
  default     = {}
}
