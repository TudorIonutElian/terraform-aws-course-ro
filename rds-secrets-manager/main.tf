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

resource "aws_secretsmanager_secret_version" "db_credentials_aws" {
  secret_id     = "education_db_credentials"
}

locals {
  database_credentials = jsondecode(aws_secretsmanager_secret_version.db_credentials_aws.secret_string)
}

resource "aws_db_instance" "education" {
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  username               = database_credentials.username
  password               = database_credentials.password
  publicly_accessible    = true
  skip_final_snapshot    = true
}