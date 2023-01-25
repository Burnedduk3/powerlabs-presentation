#Create all users from the keys in var.user
resource "aws_iam_user" "user" {
  for_each      = var.users
  name          = each.key
  path          = each.value.path
  force_destroy = each.value.force_destroy
  tags          = each.value.tags
}

#Attach list of groups (keys from var.group) to associated group (value from var.group)
resource "aws_iam_user_group_membership" "this" {
  for_each = local.attach_groups
  user     = each.key
  groups   = each.value.group_arn
}

resource "aws_iam_user_policy_attachment" "this" {
  for_each   = local.attach_policies
  user       = each.value.user
  policy_arn = each.value.policy_arn
}

resource "aws_iam_account_password_policy" "pw_policy" {
  allow_users_to_change_password = var.password_policy.allow_users_to_change_password
  max_password_age               = var.password_policy.max_password_age
  minimum_password_length        = var.password_policy.minimum_password_length
  require_numbers                = var.password_policy.require_numbers
  require_symbols                = var.password_policy.require_symbols
  require_uppercase_characters   = var.password_policy.require_uppercase_characters
}