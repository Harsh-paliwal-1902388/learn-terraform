
# csv file -> list of maps
locals {
  users = csvdecode(file("users.csv"))
}

