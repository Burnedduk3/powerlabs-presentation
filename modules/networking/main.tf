resource "aws_vpc" "this" {
  for_each   = var.vpcs
  cidr_block = each.value.cidr_block

  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "this" {
  for_each          = local.attach_subnet_vpc
  vpc_id            = each.value.vpc_name
  cidr_block        = each.value.subnet.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = each.value.name
  }
}