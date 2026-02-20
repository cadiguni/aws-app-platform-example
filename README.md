# aws-app-platform

🚀 Plataforma padrão para deploy de aplicações em AWS usando Infraestrutura como Código e CI/CD automatizado.

Este projeto demonstra uma arquitetura real de produção para aplicações containerizadas, focada em boas práticas de DevOps, automação e observabilidade.

## Visao geral

Este repositorio segue o padrao:

- `infra/modules`: componentes reutilizaveis de infraestrutura.
- `infra/envs/dev`: composicao e parametros do ambiente de desenvolvimento.
- `infra/envs/prod`: composicao e parametros do ambiente de producao.

Neste primeiro passo, o modulo `api` esta preparado como base para evoluir com recursos como API Gateway, Lambda, observabilidade e politicas de acesso.

## Estrutura

```text
.
├─ infra/
│  ├─ modules/
│  │  └─ api/
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
- AWS CLI `v2` configurado (`aws configure` ou credenciais via perfil/SSO)
- Permissoes IAM para criar recursos de infraestrutura

## Proximos passos

1. Copiar `terraform.tfvars.example` para `terraform.tfvars` em cada ambiente.
2. Ajustar `project_name`, `aws_region` e tags.
3. Executar `terraform init`, `terraform plan` e `terraform apply` no ambiente desejado.


---

## 🧱 Arquitetura

A plataforma provisiona automaticamente os seguintes recursos:

- VPC com subnets públicas e privadas
- Application Load Balancer
- ECS Fargate para execução de containers
- RDS (PostgreSQL ou MySQL)
- CloudWatch Logs e Metrics
- CI/CD com GitHub Actions
- Infraestrutura como Código com Terraform

### Diagrama (visão simplificada)

```mermaid
flowchart LR
    User --> ALB
    ALB --> ECS[ECS Fargate Service]
    ECS --> RDS[(RDS Database)]
    ECS --> CW[CloudWatch Logs]