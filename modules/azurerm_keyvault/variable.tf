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
