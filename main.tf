module "policies" {
  source          = "./modules/iam/policies"
  policies        = var.policies
  policies_folder = var.policies_folder
}

module "roles" {
  source     = "./modules/iam/roles"
  roles      = var.roles
  policies   = module.policies.policies
  depends_on = [module.policies]
}

module "groups" {
  source   = "./modules/iam/groups"
  policies = module.policies.policies
  groups   = var.groups
}

module "users" {
  source     = "./modules/iam/users"
  policies   = module.policies.policies
  users      = var.users
  groups     = module.groups.groups
  depends_on = [module.policies, module.groups]
}

module "kinesis" {
  source          = "./modules/kinesis"
  kinesis_streams = var.kinesis_streams
}

module "dynamo" {
  source          = "./modules/dynamo"
  kinesis_streams = module.kinesis.kinesis_streams
  dynamo_tables   = var.dynamo_tables
  depends_on      = [module.kinesis]
}