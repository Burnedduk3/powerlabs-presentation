variable "kinesis_streams" {
  description = "a map of amazon kinesis streams data to be created"
  type = map(object({
    shard_count = number
    retention_period = optional(number, 24)
    enforce_consumer_deletion = optional(bool, false)
    encryption_type = optional(string, "NONE")
    kms_key_id = optional(string, "")
  }))
}