variable "networks" {
  type = map(object({
    vnet_name                      = string
    location                       = string
    resource_group_name            = string
    address_space                  = list(string)
    dns_servers                    = optional(list(string))
    private_endpoint_vnet_policies = optional(string)
    tags                           = optional(map(string))

    ddos_protection_plan = optional(object({
      id     = string
      enable = optional(bool)
    }))

    subnet = optional(list(object({
      subnet_name                                   = string
      address_prefixes                              = list(string)
      security_group                                = optional(string)
      default_outbound_access_enabled               = optional(bool)
      private_endpoint_network_policies             = optional(string)
      private_link_service_network_policies_enabled = optional(bool)
      route_table_id                                = optional(string)
      service_endpoints                             = optional(list(string))
      service_endpoint_policy_ids                   = optional(list(string))

      delegation = optional(map(object({
        name = string
        service_delegation = optional(map(object({
          name    = string
          actions = list(string)
        })))
      })))
    })))
  }))
}
