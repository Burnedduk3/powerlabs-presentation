policies = {
  test = {
    description = "this is a real description"
  }
  test-2 = {
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