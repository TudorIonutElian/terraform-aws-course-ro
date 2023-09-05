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

  user_data = "<<EOT#!/bin/bash
      # package updates
      sudo yum check-update
      sudo yum update 

      # apache installation, enabling and status check
      sudo yum -y install httpd
      sudo systemctl start httpd
      sudo systemctl enable httpd

      cd /var/www/html/
      echo '<!DOCTYPE html>' > index.html
      echo '<html>' >> index.html
      echo '<head>' >> index.html
      echo '<title>Level It Up</title>' >> index.html
      echo '<meta charset="UTF-8">' >> index.html
      echo '</head>' >> index.html
      echo '<body>' >> index.html
      echo '<h1>Welcome to Level Up in Tech</h1>' >> index.html
      echo '<h3>Red Team</h3>' >> index.html
      echo '</body>' >> index.html
      echo '</html>' >> index.html
  EOT"
  
}
