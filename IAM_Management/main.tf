resource "aws_iam_user" "users" {

for_each = { for user in local.users : user.first_name => user }

  name = "${each.value.first_name}${substr(each.value.last_name, 0, 1)}"
  path = "/users/"

    tags = {
    "DisplayName" = "${each.value.first_name} ${each.value.last_name}"
    "Department"  = each.value.department
    "JobTitle"    = each.value.job_title
  }
}

resource "aws_iam_user_login_profile" "users" {
    for_each = aws_iam_user.users
  user    = each.value.name
  password_reset_required = true
  
}

output "user_passwords" {
  value = {
    for user, profile in aws_iam_user_login_profile.users :
    user => "Password created - user must reset on first login"
  }
  sensitive = true
}