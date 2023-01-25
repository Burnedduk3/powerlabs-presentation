module "policies" {
  source          = "./modules/policies"
  policies        = var.policies
  policies_folder = var.policies_folder
}

module "roles" {
  source     = "./modules/roles"
  roles      = var.roles
  policies   = module.policies.policies
  depends_on = [module.policies]
}

module "groups" {
  source   = "./modules/groups"
  policies = module.policies.policies
  groups   = var.groups
}

module "users" {
  source     = "./modules/users"
  policies   = module.policies.policies
  users      = var.users
  groups     = module.groups.groups
  depends_on = [module.policies, module.groups]
}