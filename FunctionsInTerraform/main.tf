locals {
  formatted_name = lower(var.project_name)
  new_tag        = merge(var.default_tags, var.environment_tags)
}

locals {
  # S3 bucket names: max 63 chars, lowercase, no spaces or special chars
  formatted_bucket_name = replace(replace(lower(var.bucket_name), " ", "-"), "-", "_")
}

locals {
  port_list = split(",", var.allowed_ports) #splitting string into list

  #   # Create security group rules data structure
  sg_rules = [for port in local.port_list : {
    name        = "port-${port}"
    port        = port
    description = "Allow traffic on port ${port}"
  }]
}



resource "aws_s3_bucket" "storage" {
  bucket = local.formatted_bucket_name
  tags   = local.new_tag
}

