variable "users" {
  description = "The description of the users present on the iam service"
  type = map(object({
    path = optional(string, "/")
    force_destroy = optional(bool, false)
    tags = optional(map(string))
    aws_managed_policy_names = optional(list(string), [])
    user_managed_policy_names = optional(list(string), [])
    groups = optional(list(string), [])
  }))
}

variable "password_policy" {
  description = "The password policy to apply to the AWS users"
  type = object({
    allow_users_to_change_password  = bool
    max_password_age                = number
    minimum_password_length         = number
    require_numbers                 = bool
    require_symbols                 = bool
    require_uppercase_characters    = bool
  })
  default = {
    allow_users_to_change_password  = true
    max_password_age                = 90
    minimum_password_length         = 9
    require_lowercase_characters    = true
    require_numbers                 = true
    require_symbols                 = true
    require_uppercase_characters    = true
  }
}

variable "policies" {
  description = "The policies that where created to attach to the roles, this variable is the name of the policy and the string is the arn of it"
  type = map(string)
}

variable "groups" {
  description = "The groups that where created previously "
  type = map(string)
}