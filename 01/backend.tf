terraform {
  backend "s3" {
    bucket = "terraform-aws-course-ro-central-state"
    key = "terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-aws-course-ro-db-lock-table"
  }
}