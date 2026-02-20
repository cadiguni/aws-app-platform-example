# AWS App Platform Example

Estrutura base de uma API na AWS com Terraform, separando infraestrutura reutilizavel em modulos e composicao por ambiente (`dev` e `prod`).

## Visao geral

Padrao adotado:

- `infra/modules/network`: VPC, subnets publicas/privadas, internet gateway, NAT e rotas.
- `infra/modules/alb`: Application Load Balancer, listener HTTP, target group e health check.
- `infra/modules/ecs`: ECS cluster, task definition (Fargate) e service integrado ao ALB.
- `infra/modules/rds`: PostgreSQL em subnets privadas, SG restrito e senha gerenciada no Secrets Manager.
- `infra/envs/dev` e `infra/envs/prod`: composicao dos modulos por ambiente.

## Estrutura

```text
.
├─ infra/
│  ├─ modules/
│  │  ├─ network/
│  │  │  ├─ main.tf
│  │  │  ├─ variables.tf
│  │  │  └─ outputs.tf
│  │  ├─ alb/
│  │  │  ├─ main.tf
│  │  │  ├─ variables.tf
│  │  │  └─ outputs.tf
│  │  └─ ecs/
│  │     ├─ main.tf
│  │     ├─ variables.tf
│  │     └─ outputs.tf
│  │  └─ rds/
│  │     ├─ main.tf
│  │     ├─ variables.tf
│  │     └─ outputs.tf
│  └─ envs/
│     ├─ dev/
│     │  ├─ main.tf
│     │  ├─ variables.tf
│     │  ├─ outputs.tf
│     │  └─ terraform.tfvars.example
│     └─ prod/
│        ├─ main.tf
│        ├─ variables.tf
│        ├─ outputs.tf
│        └─ terraform.tfvars.example
└─ README.md
```

## Pre-requisitos

- Terraform `>= 1.6`
- Conta AWS ativa
- AWS CLI `v2` configurado (`aws configure` ou perfil/SSO)
- Permissoes IAM para criar VPC, ALB, ECS, CloudWatch Logs e IAM Roles

## Como usar

1. Escolha o ambiente (`infra/envs/dev` ou `infra/envs/prod`).
2. Copie `terraform.tfvars.example` para `terraform.tfvars`.
3. Ajuste `project_name`, `container_image`, `aws_region` e tags.
4. Execute:

```bash
terraform init
terraform plan
terraform apply
```

## Nota de custo (Free Tier)

Para compatibilidade com contas AWS Free Tier, o RDS esta configurado com `backup_retention_period = 0` nos ambientes `dev` e `prod`.
Isso evita falhas como `FreeTierRestrictionError` relacionadas a retencao de backup.
