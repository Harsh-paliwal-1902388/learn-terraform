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
