resource "aws_instance" "example" {
  ami           = "ami-0e8459476fed2e23b"
  region        = "us-east-1"
  instance_type = "t2.micro"
  tags          = var.tags

  lifecycle {
    create_before_destroy = true
  }

  # Forces Terraform to create a replacement resource BEFORE destroying the original resource.
}
