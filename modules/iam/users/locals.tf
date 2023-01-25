locals {
  // Prepare the inputs for the resources
  aws_managed_policy_names = distinct(flatten([
    for _, value in var.users : [
      for policy_name in value.aws_managed_policy_names : [
        policy_name
      ]
    ]
  ]))

  aws_managed_policies = tomap(data.aws_iam_policy.this)

  aws_prepared_managed_policies = distinct(flatten([
    for key, value in var.users : [
      for policy_name in value.aws_managed_policy_names : {
        user        = key
        policy_arn  = local.aws_managed_policies[policy_name].arn
        policy_name = policy_name
      }
    ]
  ]))

  user_managed_prepared_policies = flatten([
    for key, value in var.users : [
      for policy_name in value.user_managed_policy_names : {
        user        = key
        policy_arn  = var.policies[policy_name]
        policy_name = policy_name
      }
    ]
  ])

  map_aws_prepared_policies = {
    for policy in local.aws_prepared_managed_policies : "${policy.user}_${policy.policy_name}" => policy
  }

  map_user_managed_prepared_policies = {
    for policy in local.user_managed_prepared_policies : "${policy.user}_${policy.policy_name}" => policy
  }

  attach_policies = merge(local.map_aws_prepared_policies, local.map_user_managed_prepared_policies)

  user_prepared_groups = flatten([
    for key, value in var.users : [
      for group_name in value.groups : {
        user       = key
        group_arn  = var.groups[group_name]
        group_name = group_name
      }
    ]
  ])

  attach_groups = {
    for group in local.user_prepared_groups : "${group.user}_${group.group_name}" => group
  }
}