variable "dynamo_tables" {
  description = "a map of amazon kinesis streams data to be created"
  type = map(object({
    billing_mode = string
    read_capacity = number
    write_capacity = number
    hash_key = string
    range_key = string
    attributes = map(string)
    kinesis_stream_name = optional(string, "")
  }))
}

variable "kinesis_streams" {
  description = "a map of kinesis streams arn"
  type = map(string)
}