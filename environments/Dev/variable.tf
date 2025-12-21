variable "rgs" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))

  }))

}

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

variable "vms" {
  type = map(object({

    nic_name            = string
    location            = string
    resource_group_name = string
    ip_configuration = list(object({
      ip_name                       = string
      subnet_id                     = optional(string)
      private_ip_address_allocation = optional(string)
      public_ip_address_id          = optional(string)
    }))

    vm_name = string
    # resource_group_name             = string
    # location                        = string
    size                            = string
    admin_username                  = string
    admin_password                  = string
    
    admin_ssh_key = optional(object({
      username   = string
      public_key = string
    }))

    os_disk = list(object({
      caching              = string
      storage_account_type = optional(string)
    }))

    source_image_reference = optional(list(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })))

    subnet_name = string
    vnet_name   = string
    kv_name     = string
    username    = string
    password    = string
    pip_name    = string

  }))
}

variable "pips" {
  type = map(object({
    pip_name            = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    tags                = map(string)
  }))

}

variable "kv" {
  type = map(object({
    kv_name                     = string
    location                    = string
    resource_group_name         = string
    enabled_for_disk_encryption = optional(bool)
    # tenant_id                   = string
    soft_delete_retention_days  = optional(number)
    purge_protection_enabled    = optional(bool)
    sku_name                    = string
    access_policy = optional(list(object({
      tenant_id           = string
      object_id           = string
      key_permissions     = optional(string)
      secret_permissions  = optional(string)
      storage_permissions = optional(string)
    })))
  }))
}

variable "kv_secret" {
  type = map(object({
    kv_secret_name = string
    secret_value = string
    # key_vault_id   = string
    kv_name        = string
    resource_group_name = string
  }))

}
