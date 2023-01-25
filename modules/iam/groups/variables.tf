variable "groups" {
  description = "The data structure describing the group attributes that are needed to create a group"
  type = map(object({
    path                      = optional(string, "/")
    aws_managed_policy_names  = optional(list(string), [])
    user_managed_policy_names = optional(list(string), [])
  }))
}

variable "policies" {
  description = "The policies that where created to attach to the roles, this variable is the name of the policy and the string is the arn of it"
  type        = map(string)
}