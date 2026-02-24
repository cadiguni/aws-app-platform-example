output "state_bucket_name" {
  description = "Bucket S3 para state remoto"
  value       = aws_s3_bucket.tf_state.bucket
}

output "lock_table_name" {
  description = "Tabela DynamoDB para lock"
  value       = aws_dynamodb_table.tf_lock.name
}
