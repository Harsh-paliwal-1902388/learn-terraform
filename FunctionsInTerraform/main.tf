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

locals {
  instnace_size = lookup(var.instance_size, var.environment, "t2.micro")
}

locals {
  configfileexists = fileexists("./config.json")
  configdata = local.configfileexists ? jsondecode(file("./config.json")) : {}
}


resource "aws_s3_bucket" "storage" {
  bucket = local.formatted_bucket_name
  tags   = local.new_tag
}

