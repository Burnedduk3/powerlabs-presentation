resource "aws_kinesis_stream" "this" {
  for_each                  = var.kinesis_streams
  name                      = each.key
  shard_count               = each.value.shard_count
  retention_period          = each.value.retention_period
  enforce_consumer_deletion = each.value.enforce_consumer_deletion
  encryption_type           = each.value.encryption_type
  kms_key_id                = each.value.kms_key_id
}