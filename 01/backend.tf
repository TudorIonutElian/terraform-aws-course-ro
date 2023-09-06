terraform {
  backend "S3" {
    bucket = "terraform-aws-course-ro-central-state"
    key = "terraform.tfstate"
    region = "eu-central-1"
  }
}