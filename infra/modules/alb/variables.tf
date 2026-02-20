variable "name_prefix" {
  description = "Prefixo para nomeacao dos recursos"
  type        = string
}

variable "vpc_id" {
  description = "ID do VPC"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets do ALB"
  type        = list(string)
}

variable "listener_port" {
  description = "Porta de entrada do listener"
  type        = number
  default     = 80
}

variable "target_port" {
  description = "Porta do target group"
  type        = number
  default     = 8080
}

variable "health_check_path" {
  description = "Path de health check"
  type        = string
  default     = "/health"
}

variable "ingress_cidr_blocks" {
  description = "CIDRs permitidos para acesso ao ALB"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "internal" {
  description = "Define se o ALB e interno"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags comuns"
  type        = map(string)
  default     = {}
}
