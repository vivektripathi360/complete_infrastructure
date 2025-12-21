variable "kv_secret" {
    type = map(object({
        kv_secret_name = string
        secret_value = string
        # key_vault_id = string
        kv_name = string
        resource_group_name = string
    }))
  
}