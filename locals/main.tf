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

resource "aws_iam_user" "my_user" {
  name = "my-user-nume-${count.index}"
  path = "/"

  count = 3

  tags = {
    "tag" = locals.tag
  }
}