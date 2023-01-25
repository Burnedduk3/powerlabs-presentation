resource "aws_dynamodb_table" "this" {
  for_each       = var.dynamo_tables
  name           = each.key
  billing_mode   = each.value.billing_mode
  read_capacity  = each.value.read_capacity
  write_capacity = each.value.write_capacity
  hash_key       = each.value.hash_key
  range_key      = each.value.range_key

  dynamic "attribute" {
    for_each = each.value.attributes
    content {
      name = attribute.key
      type = attribute.value
    }
  }
}

resource "aws_dynamodb_kinesis_streaming_destination" "this" {
  for_each   = local.attach_kinesis_dynamo
  stream_arn = each.value.kinesis_arn
  table_name = each.value.dynamo_name
}