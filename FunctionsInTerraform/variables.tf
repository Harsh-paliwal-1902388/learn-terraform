variable "project_name" {
  default = "project LOVE her"
}

variable "default_tags" {
  type = map(string)
  default = {
    company    = "TechCorp"
    managed_by = "terraform"
  }
}

variable "environment_tags" {
  type = map(string)
  default = {
    environment = "production"
    cost_center = "cc-123"
  }
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name (must be globally unique)"
  default     = "ProjectAlphaStorageBucket with CAPS and spaces!!!"
}

variable "allowed_ports" {
  default = "80,443,8080,8181"
}

variable "instance_size" {
  default = {
    dev = "t2.micro"
    staging = "t3.micro"
    prod = "t3.large"
  }
}

variable "environment" {
  default = "staging"
}