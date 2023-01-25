resource "aws_iam_group" "this" {
  for_each = var.groups
  name     = each.key
  path     = each.value.path
}

#Attach role policies to groups
#Policy name to arn lookup in var.role_assumption_policies (input from roles module)
resource "aws_iam_group_policy_attachment" "this" {
  for_each   = local.attach_policies
  group      = each.value.group
  policy_arn = each.value.policy_arn
}