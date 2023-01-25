terraform {
  backend "s3" {
    bucket = "terraform-state-juan"
    key = "/"
    dynamodb_table = "terraform-lock-table"
  }
}