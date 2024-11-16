terraform {
  backend "s3" {
    bucket         = var.data_lake_bucket
    key            = "terraform/state"
    region         = var.aws_region
    dynamodb_table = "terraform-lock"
  }
}
