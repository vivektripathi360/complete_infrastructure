resource "azurerm_resource_group" "vkrg" {
  for_each   = var.rg
  name       = each.value.name
  location   = each.value.location
  managed_by = each.value.managed_by
  tags       = each.value.tags
}
