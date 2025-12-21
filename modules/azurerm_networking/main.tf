resource "azurerm_virtual_network" "vnets" {
  for_each                       = var.networks
  name                           = each.value.vnet_name
  location                       = each.value.location
  resource_group_name            = each.value.resource_group_name
  address_space                  = each.value.address_space
  dns_servers                    = each.value.dns_servers
  private_endpoint_vnet_policies = each.value.private_endpoint_vnet_policies
  tags                           = each.value.tags

  dynamic "subnet" {
    for_each = each.value.subnet == null ? [] : each.value.subnet
    content {
      name                                          = subnet.value.subnet_name
      address_prefixes                              = subnet.value.address_prefixes
      security_group                                = subnet.value.security_group
      default_outbound_access_enabled               = subnet.value.default_outbound_access_enabled
      private_endpoint_network_policies             = subnet.value.private_endpoint_network_policies
      private_link_service_network_policies_enabled = subnet.value.private_link_service_network_policies_enabled
      route_table_id                                = subnet.value.route_table_id
      service_endpoints                             = subnet.value.service_endpoints
      service_endpoint_policy_ids                   = subnet.value.service_endpoint_policy_ids
      dynamic "delegation" {
        for_each = subnet.value.delegation == null ? {} : subnet.value.delegation
        content {
          name = delegation.value.name
          dynamic "service_delegation" {
            for_each = delegation.value.service_delegation == null ? {} : delegation.value.service_delegation
            content {
              name    = service_delegation.value.name
              actions = service_delegation.value.actions
            }
          }
        }
      }
    }
  }

  dynamic "ddos_protection_plan" {
    for_each = each.value.ddos_protection_plan == null ? [] : [each.value.ddos_protection_plan]
    content {
      id     = ddos_protection_plan.value.id
      enable = ddos_protection_plan.value.enable
    }

  }

}

