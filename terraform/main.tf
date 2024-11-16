provider "aws" {
  region = var.aws_region
}

# S3 Bucket for Data Lake
resource "aws_s3_bucket" "data_lake" {
  bucket = var.data_lake_bucket
  acl    = "private"

  versioning {
    enabled = true
  }
}

# IAM Role for Access
resource "aws_iam_role" "data_lake_access_role" {
  name = "DataLakeAccessRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = { Service = "ec2.amazonaws.com" }
      },
    ]
  })
}

# RDS Database for Data Warehouse
resource "aws_db_instance" "data_warehouse" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "14.4"
  instance_class       = "db.t3.micro"
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
  publicly_accessible  = true
  vpc_security_group_ids = [aws_security_group.db_access.id]
}

# Security Group for RDS
resource "aws_security_group" "db_access" {
  name_prefix = "db-access"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
