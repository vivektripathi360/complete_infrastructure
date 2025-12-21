data "azurerm_key_vault" "kv" {
    for_each = var.kv_secret
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}

# data "azurerm_key_vault_secret" "kvsecret" {
#   for_each = var.kv_secret
#   name         = each.value.kv_secret_name
#   key_vault_id = data.azurerm_key_vault.kv[each.key].id
# }