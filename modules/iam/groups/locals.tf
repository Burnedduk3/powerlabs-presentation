locals {
  // Prepare the inputs for the resources
  aws_managed_policy_names = distinct(flatten([
    for _, value  in var.groups:[
      for policy_name in value.aws_managed_policy_names: [
        policy_name
      ]
    ]
  ]))

  aws_managed_policies = tomap(data.aws_iam_policy.this)

  aws_prepared_managed_policies = distinct(flatten([
    for key, value in var.groups : [
      for policy_name in value.aws_managed_policy_names: {
        group = key
        policy_arn = local.aws_managed_policies[policy_name].arn
        policy_name = policy_name
      }
    ]
  ]))

  user_managed_prepared_policies = flatten([
    for key, value in var.groups : [
      for policy_name in value.user_managed_policy_names  : {
        group = key
        policy_arn = var.policies[policy_name]
        policy_name = policy_name
      }
    ]
  ])

  map_aws_prepared_policies = {
    for policy in local.aws_prepared_managed_policies : "${policy.group}_${policy.policy_name}" => policy
  }

  map_user_managed_prepared_policies = {
    for policy in local.user_managed_prepared_policies : "${policy.group}_${policy.policy_name}" => policy
  }

  attach_policies = merge(local.map_aws_prepared_policies, local.map_user_managed_prepared_policies)

  // process outputs
  // prepare the outputs from the module
  group_resources = flatten([
    for group in aws_iam_group.this : {
      name = group.name
      arn = group.arn
    }
  ])

  group_name_and_arn = {
    for group in local.group_resources : "${group.name}" => group.arn
  }
}