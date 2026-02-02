variable "tags" {
  type = map(string)
  default = {
    "Environment" = "dev"
    "Name"        = "dev-resource"
  }
}

variable "bucket_names" {
  description = "list of bucket names to create"
  type        = list(string)
  default     = ["hp3000-ma-1", "hp3000-ma-2"]
}

variable "bucket_names_set" {
  description = "set of bucket names to create"
  type        = set(string)
  default     = ["hp3000-ma-3", "hp3000-ma-4"]
}

variable "Environment" {
  type = string
  default = "dev"
}

variable "ingress_rules" {
  description = "List of ingress rules for security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTP"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTPS"
    }
  ]
}
