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

variable "tags" {
  description = "Tags comuns"
  type        = map(string)
  default = {
    managed_by = "terraform"
    env        = "prod"
  }
}
