resource "aws_vpc" "this" {
  for_each   = var.vpcs
  cidr_block = each.value.cidr_block

  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "this" {
  for_each          = local.attach_subnet_vpc
  vpc_id            = aws_vpc.this[each.value.vpc_name].id
  cidr_block        = each.value.subnet.cidr_block
  availability_zone = each.value.subnet.availability_zone

  tags = {
    Name = each.value.subnet.name
  }
}

resource "aws_vpc_endpoint" "s3" {
  for_each = local.attach_vpc_endpoints
  vpc_id            = aws_vpc.this[each.value.vpc_name].id
  service_name = each.value.vpc_endpoint
}