<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=4.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=4.48.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_account_password_policy.pw_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_password_policy) | resource |
| [aws_iam_user.user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_iam_user_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_groups"></a> [groups](#input\_groups) | The groups that where created previously | `map(string)` | n/a | yes |
| <a name="input_password_policy"></a> [password\_policy](#input\_password\_policy) | The password policy to apply to the AWS users | <pre>object({<br>    allow_users_to_change_password  = bool<br>    max_password_age                = number<br>    minimum_password_length         = number<br>    require_numbers                 = bool<br>    require_symbols                 = bool<br>    require_uppercase_characters    = bool<br>  })</pre> | <pre>{<br>  "allow_users_to_change_password": true,<br>  "max_password_age": 90,<br>  "minimum_password_length": 9,<br>  "require_lowercase_characters": true,<br>  "require_numbers": true,<br>  "require_symbols": true,<br>  "require_uppercase_characters": true<br>}</pre> | no |
| <a name="input_policies"></a> [policies](#input\_policies) | The policies that where created to attach to the roles, this variable is the name of the policy and the string is the arn of it | `map(string)` | n/a | yes |
| <a name="input_users"></a> [users](#input\_users) | The description of the users present on the iam service | <pre>map(object({<br>    path = optional(string, "/")<br>    force_destroy = optional(bool, false)<br>    tags = optional(map(string))<br>    aws_managed_policy_names = optional(list(string), [])<br>    user_managed_policy_names = optional(list(string), [])<br>    groups = optional(list(string), [])<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->