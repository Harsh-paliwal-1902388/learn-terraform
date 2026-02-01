terraform {
  backend "s3" {
    bucket       = "harshp3000-bucket-tf"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
