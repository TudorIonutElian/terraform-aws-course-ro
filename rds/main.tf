terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  shared_config_files = ["~/.aws/config"]
  shared_credentials_files = [ "~/.aws/credentials" ]
  profile = "default"
}

resource "aws_db_instance" "education" {
  identifier             = "education"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "14.1"
  username               = "edu"
  password               = var.db_password
  publicly_accessible    = true
  skip_final_snapshot    = true
}