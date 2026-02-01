terraform {
#       backend "s3" {
#     bucket = "harshp3000-bucket-tf"
#     key    = "dev/terraform.tfstate"
#     region = "us-east-1"
#     encrypt = true
#     use_lockfile = true
#   }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# declaration of variable

variable "Environment" {
    default = "Dev"
    type = string
}

#Create S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "harshp3000-bucket-1"

  tags = {
    Name        = "${var.Environment}-Bucket"
    Environment = var.Environment #Reference of variable var.<name>
  }
}

#Create VPC

resource "aws_vpc" "example-tf" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "${var.Environment}-VPC"
    Environment = var.Environment
  }
}