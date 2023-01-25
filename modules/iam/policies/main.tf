resource "aws_iam_policy" "this" {
  for_each = var.policies
  name        = each.key
  path        = each.value.path
  description = each.value.description
  policy = file("${path.cwd}/${var.policies_folder}/${each.key}.json")
  tags = each.value.tags
}