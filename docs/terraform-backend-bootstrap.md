# Terraform Backend Bootstrap

Este projeto usa backend remoto S3 + DynamoDB para evitar divergencia de state entre execucoes locais e GitHub Actions.

## 1) Criar backend remoto (uma vez)

```bash
cd infra/bootstrap
terraform init
terraform apply
```

Recursos criados:

- Bucket S3 de state com versioning, encryption e bloqueio publico
- Tabela DynamoDB para lock de state

## 2) Inicializar ambientes com backend remoto

```bash
terraform -chdir=infra/envs/dev init -reconfigure
terraform -chdir=infra/envs/prod init -reconfigure
```

## 3) Se recursos ja existem na AWS (caso de migracao)

Se aparecer erro `already exists`, importe os recursos para o state remoto do ambiente correspondente.

Exemplo (dev):

```bash
terraform -chdir=infra/envs/dev import module.alb.aws_lb.this <alb_arn>
terraform -chdir=infra/envs/dev import module.alb.aws_lb_target_group.this <target_group_arn>
terraform -chdir=infra/envs/dev import module.ecs.aws_cloudwatch_log_group.this /ecs/aws-app-platform-dev
terraform -chdir=infra/envs/dev import module.ecs.aws_iam_role.execution aws-app-platform-dev-ecs-execution-role
terraform -chdir=infra/envs/dev import module.ecs.aws_iam_role.task aws-app-platform-dev-ecs-task-role
terraform -chdir=infra/envs/dev import module.rds.aws_db_subnet_group.this aws-app-platform-dev-db-subnet-group
```

Depois:

```bash
terraform -chdir=infra/envs/dev plan
```

Repita para `prod` quando aplicavel.
