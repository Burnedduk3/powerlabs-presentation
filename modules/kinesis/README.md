<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=4.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=4.48.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kinesis_stream.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_stream) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dynamo_tables"></a> [dynamo\_tables](#input\_dynamo\_tables) | a map of amazon kinesis streams data to be created | <pre>map(object({<br>    shard_count = number<br>    retention_period = optional(number, 24)<br>    enforce_consumer_deletion = optional(bool, false)<br>    encryption_type = optional(string, "NONE")<br>    kms_key_id = optional(string, "")<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kinesis_streams"></a> [kinesis\_streams](#output\_kinesis\_streams) | n/a |
<!-- END_TF_DOCS -->