locals {
  // prepare the outputs from the modules
  kinesis_resources = flatten([
    for kinesis_stream in aws_kinesis_stream.this : {
      name = kinesis_stream.name
      arn  = kinesis_stream.arn
    }
  ])

  kinesis_name_arn = {
    for kinesis in local.kinesis_resources : "${kinesis.name}" => kinesis.arn
  }
}