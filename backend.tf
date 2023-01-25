terraform {
  backend "s3" {
    bucket         = "terraform-state-juan"
    key            = "state/"
    dynamodb_table = "dynamo-lock-table"
    region         = "us-east-1"
  }
}