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

    vm_name                         = strin
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


