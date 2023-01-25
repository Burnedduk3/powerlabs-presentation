locals {
  // Prepare the inputs for the resources
  aws_managed_policy_names = distinct(flatten([
    for _, value in var.roles : [
      for policy_name in value.aws_managed_policies_names : [
        policy_name
      ]
    ]
  ]))

  aws_managed_policies = tomap(data.aws_iam_policy.this)

  aws_prepared_managed_policies = distinct(flatten([
    for key, value in var.roles : [
      for policy_name in value.aws_managed_policies_names : {
        role        = key
        policy_arn  = local.aws_managed_policies[policy_name].arn
        policy_name = policy_name
      }
    ]
  ]))

  user_managed_prepared_policies = flatten([
    for key, value in var.roles : [
      for policy_name in value.managed_policies_names : {
        role        = key
        policy_arn  = var.policies[policy_name]
        policy_name = policy_name
      }
    ]
  ])

  map_aws_prepared_policies = {
    for policy in local.aws_prepared_managed_policies : "${policy.role}_${policy.policy_name}" => policy
  }

  map_user_managed_prepared_policies = {
    for policy in local.user_managed_prepared_policies : "${policy.role}_${policy.policy_name}" => policy
  }

  attach_policies = merge(local.map_aws_prepared_policies, local.map_user_managed_prepared_policies)

  // prepare the outputs from the module
  role_resources = flatten([
    for role in aws_iam_role.this : {
      name = role.name
      arn  = role.arn
    }
  ])

  role_name_and_arn = {
    for role in local.role_resources : "${role.name}" => role.arn
  }
}