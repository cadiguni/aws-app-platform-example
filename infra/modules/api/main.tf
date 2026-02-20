terraform {
  required_version = ">= 1.6.0"
}

locals {
  api_name = "${var.project_name}-${var.environment}-api"
}

# Base do modulo de API.
# Evolua aqui com recursos como API Gateway, Lambda, WAF e observabilidade.
