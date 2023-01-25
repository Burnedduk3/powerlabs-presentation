locals {
  //prepare input for module
  vpc_network = distinct(flatten([
    for key, value in var.vpcs : [
      for subnet in value.subnets : {
        vpc_name    = key
        subnet      = subnet
        subnet_name = subnet.name
      }
    ]
  ]))

  attach_subnet_vpc = {
    for subnet_data in vpc_network : "${subnet_data.vpc_name}_${subnet_data.subnet_name}" => {
      vpc_name : subnet_data.vpc_name
      subnet = subnet_data.subnet
    }
  }
}