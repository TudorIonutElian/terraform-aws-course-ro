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

data "aws_secretsmanager_secret_version" "db_credentials_aws" {
  secret_id     = "education_db_credentials_2"
}

locals {
  database_credentials = jsondecode(data.aws_secretsmanager_secret_version.db_credentials_aws.secret_string)
}

resource "aws_db_instance" "education" {
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  username               = local.database_credentials.user
  password               = local.database_credentials.password
  publicly_accessible    = true
  skip_final_snapshot    = true
}