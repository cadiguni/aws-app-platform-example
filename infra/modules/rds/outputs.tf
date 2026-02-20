output "db_instance_id" {
  description = "ID da instancia RDS"
  value       = aws_db_instance.this.id
}

output "db_endpoint" {
  description = "Endpoint do banco"
  value       = aws_db_instance.this.address
}

output "db_port" {
  description = "Porta do banco"
  value       = aws_db_instance.this.port
}

output "db_name" {
  description = "Nome do banco"
  value       = aws_db_instance.this.db_name
}

output "db_username" {
  description = "Usuario master"
  value       = aws_db_instance.this.username
}

output "db_security_group_id" {
  description = "Security group do banco"
  value       = aws_security_group.rds.id
}

output "master_user_secret_arn" {
  description = "ARN do segredo da senha master no Secrets Manager"
  value       = aws_db_instance.this.master_user_secret[0].secret_arn
}

output "secure_connection_string" {
  description = "Connection string com password referenciada via Secrets Manager dynamic reference"
  value       = "postgresql://${aws_db_instance.this.username}:{{resolve:secretsmanager:${aws_db_instance.this.master_user_secret[0].secret_arn}:SecretString:password}}@${aws_db_instance.this.address}:${aws_db_instance.this.port}/${aws_db_instance.this.db_name}"
}

