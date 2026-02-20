terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.tags
  }
}

locals {
  name_prefix = "${var.project_name}-${var.environment}"
}

module "network" {
  source = "../../modules/network"

  name_prefix        = local.name_prefix
  vpc_cidr           = var.vpc_cidr
  az_count           = var.az_count
  single_nat_gateway = var.single_nat_gateway
  tags               = var.tags
}

module "alb" {
  source = "../../modules/alb"

  name_prefix         = local.name_prefix
  vpc_id              = module.network.vpc_id
  subnet_ids          = module.network.public_subnet_ids
  listener_port       = var.alb_listener_port
  target_port         = var.app_port
  health_check_path   = var.health_check_path
  ingress_cidr_blocks = var.alb_ingress_cidr_blocks
  internal            = var.alb_internal
  tags                = var.tags
}

module "ecs" {
  source = "../../modules/ecs"

  name_prefix           = local.name_prefix
  vpc_id                = module.network.vpc_id
  private_subnet_ids    = module.network.private_subnet_ids
  alb_security_group_id = module.alb.alb_security_group_id
  target_group_arn      = module.alb.target_group_arn
  container_name        = var.container_name
  container_image       = var.container_image
  container_port        = var.app_port
  container_environment = var.container_environment
  task_cpu              = var.task_cpu
  task_memory           = var.task_memory
  desired_count         = var.desired_count
  log_retention_in_days = var.log_retention_in_days
  tags                  = var.tags
}

module "rds" {
  source = "../../modules/rds"

  name_prefix                  = local.name_prefix
  vpc_id                       = module.network.vpc_id
  private_subnet_ids           = module.network.private_subnet_ids
  allowed_security_group_ids   = [module.ecs.service_security_group_id]
  allowed_cidr_blocks          = var.rds_allowed_cidr_blocks
  db_name                      = var.db_name
  db_username                  = var.db_username
  db_port                      = var.db_port
  engine_version               = var.db_engine_version
  instance_class               = var.db_instance_class
  allocated_storage            = var.db_allocated_storage
  max_allocated_storage        = var.db_max_allocated_storage
  backup_retention_period      = var.db_backup_retention_period
  backup_window                = var.db_backup_window
  maintenance_window           = var.db_maintenance_window
  multi_az                     = var.db_multi_az
  deletion_protection          = var.db_deletion_protection
  skip_final_snapshot          = var.db_skip_final_snapshot
  performance_insights_enabled = var.db_performance_insights_enabled
  apply_immediately            = var.db_apply_immediately
  tags                         = var.tags
}
