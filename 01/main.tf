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

# Prima noastra resursa AWS
resource "aws_vpc" "primul_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "my_first_tag" = "my_first_tag_value"
    "my_second_tag" = "my_second_tag_value"
  }
}
