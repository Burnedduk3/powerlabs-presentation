variable "policies" {
  description = "A map of objects containing the necessary information to create x amount of policies on iam service"
  type = map(object({
    description = string
    path = optional(string, "/")
    tags = optional(map(string), {})
  }))
}

variable "policies_folder" {
  description = "The name of the folder on the root level of the module where all the policies are contained"
  type = string
}