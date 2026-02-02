#Count example: It will work on list

resource "aws_s3_bucket" "bucket1" {
  count  = 2
  bucket = var.bucket_names[count.index]

  tags = var.tags
}

#for_each example: It will work on set or map

## This is wrong: for each argument must be a map or a set of strings
# resource "aws_s3_bucket" "bucket2" {
#   for_each = length(var.bucket_names_set) #You can hardcode it as well if you know length of set
#   bucket   = var.bucket_names_set[each.key]

#   tags = var.tags
# }

resource "aws_s3_bucket" "bucket2" {
  for_each = var.bucket_names_set #It will iterate through set
  bucket   = each.value
  #   bucket   = each.key (can use either as in set both are same, diff will be in maps)

  depends_on = [aws_s3_bucket.bucket1] #depends on bucket 1, means bucket1 will be created first

  tags = var.tags
}

