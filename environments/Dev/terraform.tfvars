rg = {
  rg1 = {
    name       = "vk-rg1"
    location   = "eastus"
    managed_by = "community"
    tags = {
      dev         = "vivek"
      environment = "Dev"
    }
  }
}

networks = {
  "vnet1" = {
    vnet_name               = "vk-vnet1"
    location            = "eastus"
    resource_group_name = "vk-rg1"
    address_space       = ["10.0.0.0/16"]
    subnet = [
      {
        subnet_name      = "font-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      ,
      {
        subnet_name      = "back-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]

  }
}

pips = {

  pip1 = {
    pip_name            = "font-pip1"
    resource_group_name = "vk-rg1"
    location            = "eastus"
    allocation_method   = "Static"
    tags = {
      environment = "dev"
      managed_by  = "vv"
    }
  }

  pip2 = {
    pip_name            = "back-pip"
    resource_group_name = "vk-rg1"
    location            = "eastus"
    allocation_method   = "Static"
    tags = {
      environment = "dev"
      managed_by  = "vv"
    }
  }
}

kv = {
  kv = {
    kv_name             = "vk-vault"
    location            = "eastus"
    resource_group_name = "vk-rg1"
    sku_name            = "standard"
  }
}

kv_secret = {
  secret1 = {
    kv_secret_name = "font-username"
    secret_value = "vk-admin1"
    kv_name = "vk-vault"
   resource_group_name = "vk-rg1"
  }
  secret2 = {
   kv_secret_name = "back-username"
   secret_value = "vk-admin2"
   kv_name = "vk-vault"
   resource_group_name = "vk-rg1"
  }
  secret3 = {
   kv_secret_name = "font-password"
   secret_value = "admin@1234567"
   kv_name = "vk-vault"
   resource_group_name = "vk-rg1"
  }
secret4 = {
   kv_secret_name = "back-password"
   secret_value = "admin@1234567"
   kv_name = "vk-vault"
   resource_group_name = "vk-rg1"
  }
}
vms = {
  vm5 = {

    nic_name = "nic-font"
    ip_configuration = [
      { ip_name                       = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    ]
    subnet_name                   = "font-subnet"
    vnet_name                     = "vk-vnet1"
    kv_name                       = "vk-vault"
    username                      = "font-username"
    password                      = "font-password"
    pip_name                      = "font-pip1"
    nic_name                      = "nic-font"
    location                      = "eastus"
    resource_group_name           = "vk-rg1"
    admin_username                  = "vk-admin"
    admin_password                  = "admin@1234567"
    ip_name                       = "font-ip"
    private_ip_address_allocation = "Dynamic"
    vm_name                       = "font-vm"
    size                          = "Standard_D2s_v3"
    os_disk = [
      {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    ]
    
    source_image_reference = [{
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-"
      sku       = "22_04-lts"
      version   = "latest"
    }]
  }

  vm6 = {

    nic_name = "vk-nic"
    ip_configuration = [
      { ip_name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    ]
    subnet_name                   = "back-subnet"
    vnet_name                     = "vk-vnet1"
    kv_name                       = "vk-vault"
    username                      = "back-username"
    password                      = "back-password"
    pip_name                      = "back-pip"
    nic_name                      = "vk-nic"
    location                      = "eastus"
    resource_group_name           = "vk-rg1"
    ip_name                       = "back-ip"
    private_ip_address_allocation = "Dynamic"
    vm_name                       = "back-vm"
    admin_username                  = "vk-admin"
    admin_password                  = "admin@1234567"
    size                          = "Standard_D2s_v3"
    os_disk = [
      {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    ]
    source_image_reference = [{
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-"
      sku       = "22_04-lts"
      version   = "latest"
    }]
  }
}