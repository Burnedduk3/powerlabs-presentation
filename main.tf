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