data "aws_iam_policy" "this" {
  for_each = toset(local.aws_managed_policy_names)
  arn = "arn:aws:iam::aws:policy/${each.value}"
}