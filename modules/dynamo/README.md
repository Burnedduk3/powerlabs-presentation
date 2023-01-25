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
| [aws_dynamodb_kinesis_streaming_destination.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_kinesis_streaming_destination) | resource |
| [aws_dynamodb_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dynamo_tables"></a> [dynamo\_tables](#input\_dynamo\_tables) | a map of amazon kinesis streams data to be created | <pre>map(object({<br>    billing_mode = string<br>    read_capacity = number<br>    write_capacity = number<br>    hash_key = string<br>    range_key = string<br>    attributes = map(string)<br>    kinesis_stream_name = optional(string, "")<br>  }))</pre> | n/a | yes |
| <a name="input_kinesis_streams"></a> [kinesis\_streams](#input\_kinesis\_streams) | a map of kinesis streams arn | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dynamo_name_arn"></a> [dynamo\_name\_arn](#output\_dynamo\_name\_arn) | n/a |
<!-- END_TF_DOCS -->