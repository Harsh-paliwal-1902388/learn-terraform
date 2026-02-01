terraform {
      backend "s3" {
    bucket = "harshp3000-bucket-tf"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }

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

#Create S3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "harshp3000-bucket-1"

  tags = {
    Name        = "My bucket hp"
    Environment = "Dev"
  }
}

# I deleted the state file from s3 to prevent charging