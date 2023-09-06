terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  cloud {
    organization = "TerraformAWSCourseRo"

    workspaces {
      name = "terraform-aws-course-ro-additional"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  shared_config_files = ["~/.aws/config"]
  shared_credentials_files = [ "~/.aws/credentials" ]
}

resource "aws_iam_user" "my_user" {
  name = "my-user-nume-${count.index}"
  path = "/"

  count = 3

  tags = {
    "nume" = "my-user-tag-nume"
  }
}

# Prima noastra resursa AWS
resource "aws_vpc" "primul_vpc" {
  cidr_block = "10.0.0.0/16"
  count = 1

  tags = {
    "my_first_tag" = "my_first_tag_value"
    "my_second_tag" = "my_second_tag_value"
  }
}

/*
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


resource "aws_key_pair" "terraform_key_ro" {
  key_name = "terraform_key_ro"
  public_key = file("~/.ssh/terraform_key_ro.pub")
}

# Prima noastra instanta ec2
resource "aws_instance" "prima_instanta_ec2" {
  ami = data.aws_ami.ami_favorit.id
  #ami = "ami-0766f68f0b06ab145"
  instance_type = var.my_instance[0]
  count = var.my_instance[1]
  #count = null || 5
  key_name = aws_key_pair.terraform_key_ro.key_name

  user_data = "${file("entry.sh")}"

  tags = {
    "Contine Bool" = var.my_instance[2] ? "my instance contine bool" : "my instance nu contine bool"
    "Contine NULL" = "null"
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
resource "aws_s3_object" "my_object" {
  bucket = "terraform-aws-course-ro-version-bucket"
  key = "myfile.txt"
  source = "myfile.txt"

  etag = file("myfile.txt")
}
*/
