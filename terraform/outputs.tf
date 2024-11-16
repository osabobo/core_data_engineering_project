output "data_lake_bucket_name" {
  description = "Name of the S3 bucket used as the data lake"
  value       = aws_s3_bucket.data_lake.bucket
}

output "rds_endpoint" {
  description = "Endpoint for the RDS instance"
  value       = aws_db_instance.data_warehouse.endpoint
}

output "rds_username" {
  description = "Username for the RDS database"
  value       = aws_db_instance.data_warehouse.username
}
