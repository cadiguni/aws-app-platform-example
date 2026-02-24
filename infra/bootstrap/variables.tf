variable "aws_region" {
  description = "Regiao AWS para recursos de backend"
  type        = string
  default     = "us-east-1"
}

variable "state_bucket_name" {
  description = "Nome globalmente unico do bucket de state"
  type        = string
  default     = "aws-app-platform-tfstate-229371276586-us-east-1"
}

variable "lock_table_name" {
  description = "Nome da tabela DynamoDB para lock de state"
  type        = string
  default     = "aws-app-platform-terraform-locks"
}

variable "tags" {
  description = "Tags comuns"
  type        = map(string)
  default = {
    project    = "aws-app-platform"
    managed_by = "terraform"
  }
}
