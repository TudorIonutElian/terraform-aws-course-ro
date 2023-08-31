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

# primul data source
data "aws_ami" "ami_favorit" {
  owners = ["amazon"]
  most_recent = true

  filter {
    name = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}

# Prima noastra instanta ec2
resource "aws_instance" "prima_instanta_ec2" {
  ami = data.aws_ami.ami_favorit.id
  #ami = "ami-0766f68f0b06ab145"
  instance_type = "t2.micro"
  #count = 2

  tags = {
    "my_first_ec2_instance_tag" = "my_first_ec2_instance__value"
    "my_second_ec2_instance_tag" = "my_second_ec2_instance_tag_value"
  }
  
}

# Primul nostru S3 bucket
resource "aws_s3_bucket" "primul_bucket" {
  bucket = "terraform-aws-course-ro-version-bucket"

  tags = {
    Name = "My first bucket"
    Environment = "Course AWS"
  }
}

# incarcare fisier dupa creare s3 bucket
/*
resource "aws_s3_object" "my_object" {
  bucket = "terraform-aws-course-ro-version-bucket"
  key = "myfile.txt"
  source = "myfile.txt"

  etag = file("myfile.txt")
}
*/
