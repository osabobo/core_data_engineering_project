variable "aws_region" {
  description = "AWS region for provisioning resources"
  default     = "us-east-1"
}

variable "data_lake_bucket" {
  description = "S3 bucket name for the data lake"
  default     = "my-data-lake-bucket"
}

variable "db_name" {
  description = "Name of the RDS database"
  default     = "travel_data_warehouse"
}

variable "db_username" {
  description = "Username for the RDS database"
  default     = "admin"
}

variable "db_password" {
  description = "Password for the RDS database"
  default     = "securepassword123"
}
