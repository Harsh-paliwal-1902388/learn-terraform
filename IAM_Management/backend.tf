terraform {
  backend "s3" {
    bucket = "harshp3000-bucket-tf"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}