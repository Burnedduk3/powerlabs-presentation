policies = {
  test = {
    description = "this is a real description"
  }
  test-2 = {
    description = "this is a real description"
  }
  test-3 = {
    description = "this is a real description"
  }
}

roles = {
  test-role = {
    description                = "This is the description"
    aws_managed_policies_names = ["IAMFullAccess", "TranslateFullAccess"]
    managed_policies_names     = ["test", "test-2"]
  }
  test-role-2 = {
    description                = "This is the description"
    assume_role_policy_path    = "policies/assume-role.json",
    aws_managed_policies_names = ["IAMFullAccess", "AWSDirectConnectReadOnlyAccess"]
    managed_policies_names     = ["test"]
  }
}

groups = {
  test-group = {
    aws_managed_policy_names  = ["IAMFullAccess", "TranslateFullAccess"]
    user_managed_policy_names = ["test"]
  }
}

users = {
  eks-example = {
    aws_managed_policy_names  = ["IAMFullAccess", "TranslateFullAccess"]
    user_managed_policy_names = ["test"]
    groups                    = ["test-group"]
  }
}


policies_folder = "policies"

kinesis_streams = {
  kinesis_test = {
    shard_count               = 1
    retention_period          = 54
    enforce_consumer_deletion = false
    encryption_type           = "NONE"
  }
  kinesis_test_2 = {
    shard_count               = 2
    retention_period          = 100
    enforce_consumer_deletion = true
    encryption_type           = "NONE"
  }
}

dynamo_tables = {
  dynamo_test = {
    billing_mode   = "PROVISIONED"
    read_capacity  = 20
    write_capacity = 20
    hash_key       = "userID"
    range_key      = "TableName"
    attributes = {
      userID : "N"
      TableName : "N"
    }
    kinesis_stream_name = "kinesis_test"
  }
  dynamo_test_2 = {
    billing_mode   = "PROVISIONED"
    read_capacity  = 23
    write_capacity = 14
    hash_key       = "userID"
    range_key      = "TableName"
    attributes = {
      userID : "N"
      TableName : "N"
    }
    kinesis_stream_name = "kinesis_test_2"
  }
}

vpcs = {
  test = {
    cidr_block = "10.0.0.0/16"
    subnets = [
      {
        cidr_block        = "10.0.0.0/24"
        name              = "main-1a"
        availability_zone = "us-east-1a"
      },
      {
        cidr_block        = "10.0.1.0/24"
        name              = "main-1b"
        availability_zone = "us-east-1b"
      },
      {
        cidr_block        = "10.0.2.0/24"
        name              = "main-1c"
        availability_zone = "us-east-1c"
      }
    ]
    vpc_endpoints = ["com.amazonaws.us-west-2.s3"]
  }
}