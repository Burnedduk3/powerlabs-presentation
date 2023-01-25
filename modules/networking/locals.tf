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
    for subnet_data in local.vpc_network : "${subnet_data.vpc_name}_${subnet_data.subnet_name}" => {
      vpc_name : subnet_data.vpc_name
      subnet = subnet_data.subnet
    }
  }

  vpc_endpoints = distinct(flatten([
    for key, value in var.vpcs : [
      for vpc_endpoint in value.vpc_endpoints : {
        vpc_name    = key
        vpc_endpoint      = vpc_endpoint
      }
    ]
  ]))

  attach_vpc_endpoints = {
    for vpc_endpoint in local.vpc_endpoints : "${vpc_endpoint.vpc_name}_${vpc_endpoint.vpc_endpoint}" => {
      vpc_endpoint : vpc_endpoint.vpc_endpoint
      vpc_name: vpc_endpoint.vpc_name
    }
  }
}