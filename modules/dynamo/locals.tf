locals {
  //prepare input for module
  attach_kinesis_dynamo = {
    for key, value in var.dynamo_tables : "${key}_${value.kinesis_stream_name}" => {
      dynamo_name: key
      kinesis_arn: var.kinesis_streams[value.kinesis_stream_name]
    }
  }

  // prepare the outputs from the modules
  dynamo_resources = flatten([
    for dynamo_table in aws_dynamodb_table.this : {
      name = dynamo_table.name
      arn = dynamo_table.arn
    }
  ])

  dynamo_name_arn = {
    for dynamo in local.dynamo_resources : "${dynamo.name}" => dynamo.arn
  }
}