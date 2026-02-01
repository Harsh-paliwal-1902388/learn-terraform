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