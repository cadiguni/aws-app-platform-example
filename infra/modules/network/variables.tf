variable "name_prefix" {
  description = "Prefixo para nomeacao dos recursos"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR do VPC"
  type        = string
}

variable "az_count" {
  description = "Quantidade de AZs/subnets publicas e privadas"
  type        = number
  default     = 2

  validation {
    condition     = var.az_count >= 2
    error_message = "az_count deve ser maior ou igual a 2."
  }
}

variable "single_nat_gateway" {
  description = "Se true, cria um NAT Gateway unico"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags comuns"
  type        = map(string)
  default     = {}
}
