variable "roles" {
  description = "The variable containing all the necessary information to create a role with managed and user managed policies"
  type = map(object({
    description                = optional(string, "")
    assume_role_policy_path    = optional(string, "policies/assume-role-default.json")
    force_detach_policies      = optional(bool, true)
    max_session_duration       = optional(number, 14400)
    managed_policies_names     = optional(list(string), [])
    aws_managed_policies_names = optional(list(string), [])
    path                       = optional(string, "/")
    tags                       = optional(map(string), {})
  }))
}

variable "policies" {
  description = "The policies that where created to attach to the roles, this variable is the name of the policy and the string is the arn of it"
  type        = map(string)
}