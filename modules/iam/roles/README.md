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
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_policies"></a> [policies](#input\_policies) | The policies that where created to attach to the roles, this variable is the name of the policy and the string is the arn of it | `map(string)` | n/a | yes |
| <a name="input_roles"></a> [roles](#input\_roles) | The variable containing all the necessary information to create a role with managed and user managed policies | <pre>map(object({<br>    description = optional(string, "")<br>    assume_role_policy_path = optional(string, "policies/assume-role-default.json")<br>    force_detach_policies = optional(bool, true)<br>    max_session_duration = optional(number, 14400)<br>    managed_policies_names = optional(list(string), [])<br>    aws_managed_policies_names = optional(list(string), [])<br>    path = optional(string, "/")<br>    tags = optional(map(string), {})<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_roles"></a> [roles](#output\_roles) | n/a |
<!-- END_TF_DOCS -->