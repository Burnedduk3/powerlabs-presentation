locals {
  // prepare the outputs from the modules
  policy_resources = flatten([
    for policy in aws_iam_policy.this : {
      name = policy.name
      arn  = policy.arn
    }
  ])

  policy_name_and_arn = {
    for policy in local.policy_resources : "${policy.name}" => policy.arn
  }
}