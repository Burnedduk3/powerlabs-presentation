variable "policies" {
  description = "A map of objects containing the necessary information to create x amount of policies on iam service"
  type = map(object({
    description = string
    path        = optional(string, "/")
    tags        = optional(map(string), {})
  }))
}

variable "policies_folder" {
  description = "The path to the folder containing the policies, ej: policies, if it is multiple levels of folders, ej: policies/iam. note that there is no ending or starting slash "
  type        = string
}

variable "roles" {
  description = "The variable containing all the necessary information to create a role with managed and user managed policies"
  default     = {}
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

variable "groups" {
  description = "The data structure describing the group attributes that are needed to create a group"
  default     = {}
  type = map(object({
    path                      = optional(string, "/")
    aws_managed_policy_names  = optional(list(string), [])
    user_managed_policy_names = optional(list(string), [])
  }))
}

variable "users" {
  description = "This variable is equal to the user variable on the user module, this is an optional variable if it is necessary to create users based on the policies that where created."
  default     = {}
  type = map(object({
    path                      = optional(string, "/")
    force_destroy             = optional(bool, false)
    tags                      = optional(map(string))
    aws_managed_policy_names  = optional(list(string), [])
    user_managed_policy_names = optional(list(string), [])
  }))
}