module "azurerm_resource_group" {
  source = "../../modules/resource_group"
  rgs    = var.rgs
}

module "networks" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../modules/azurerm_networking"
  networks   = var.networks

}

module "pips" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../modules/Public-IP"
  pips       = var.pips

}

# module "kv" {
#   depends_on = [module.azurerm_resource_group]
#   source     = "../../modules/azurerm_keyvault"
#   kv         = var.kv

# }

module "kv_secret" {
  depends_on = [module.kv]
  source     = "../../modules/azurem_keysecret"
  kv_secret  = var.kv_secret

}
module "vms" {

  depends_on = [module.azurerm_resource_group, module.networks, module.pips, module.kv, module.kv_secret]

  source = "../../modules/azurerm_VM"

  vms = var.vms

}
