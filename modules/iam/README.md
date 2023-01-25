<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=4.48.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_groups"></a> [groups](#module\_groups) | ./modules/groups | n/a |
| <a name="module_policies"></a> [policies](#module\_policies) | ./modules/policies | n/a |
| <a name="module_roles"></a> [roles](#module\_roles) | ./modules/roles | n/a |
| <a name="module_users"></a> [users](#module\_users) | ./modules/users | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_groups"></a> [groups](#input\_groups) | The data structure describing the group attributes that are needed to create a group | <pre>map(object({<br>    path = optional(string, "/")<br>    aws_managed_policy_names = optional(list(string), [])<br>    user_managed_policy_names = optional(list(string), [])<br>  }))</pre> | `{}` | no |
| <a name="input_policies"></a> [policies](#input\_policies) | A map of objects containing the necessary information to create x amount of policies on iam service | <pre>map(object({<br>    description = string<br>    path = optional(string, "/")<br>    tags = optional(map(string), {})<br>  }))</pre> | n/a | yes |
| <a name="input_policies_folder"></a> [policies\_folder](#input\_policies\_folder) | The path to the folder containing the policies, ej: policies, if it is multiple levels of folders, ej: policies/iam. note that there is no ending or starting slash | `string` | n/a | yes |
| <a name="input_roles"></a> [roles](#input\_roles) | The variable containing all the necessary information to create a role with managed and user managed policies | <pre>map(object({<br>    description = optional(string, "")<br>    assume_role_policy_path = optional(string, "policies/assume-role-default.json")<br>    force_detach_policies = optional(bool, true)<br>    max_session_duration = optional(number, 14400)<br>    managed_policies_names = optional(list(string), [])<br>    aws_managed_policies_names = optional(list(string), [])<br>    path = optional(string, "/")<br>    tags = optional(map(string), {})<br>  }))</pre> | `{}` | no |
| <a name="input_users"></a> [users](#input\_users) | This variable is equal to the user variable on the user module, this is an optional variable if it is necessary to create users based on the policies that where created. | <pre>map(object({<br>    path = optional(string, "/")<br>    force_destroy = optional(bool, false)<br>    tags = optional(map(string))<br>    aws_managed_policy_names = optional(list(string), [])<br>    user_managed_policy_names = optional(list(string), [])<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policies"></a> [policies](#output\_policies) | n/a |
| <a name="output_roles"></a> [roles](#output\_roles) | n/a |
<!-- END_TF_DOCS -->