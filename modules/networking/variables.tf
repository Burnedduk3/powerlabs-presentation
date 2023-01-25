variable "vpcs" {
  description = "a map of vpc to be created"
  type = map(object({
    cidr_block = string
    subnets = list(object({
      cidr_block        = string
      name              = string
      availability_zone = string
    }))
    vpc_endpoints = list(string)
  }))
}