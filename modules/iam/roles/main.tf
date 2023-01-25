resource "aws_iam_role" "this" {
  for_each = var.roles
  name                = each.key
  assume_role_policy  = file("${path.cwd}/${each.value.assume_role_policy_path}")
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each   = local.attach_policies
  role       = each.value.role
  policy_arn = each.value.policy_arn
}