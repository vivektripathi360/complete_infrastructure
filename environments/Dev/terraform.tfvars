rgs = {
  rg1 = {
    name       = "vk-rg"
    location   = "eastus"
    managed_by = "devopsinsiders"
    tags = {
      dev         = "vivek"
      environment = "Dev"
    }
  }
}

networks = {
  "vnet1" = {
    vnet_name               = "vk-vnet"
    location            = "eastus"
    resource_group_name = "vk-rg"
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
    pip_name            = "font-pip"
    resource_group_name = "vk-rg"
    location            = "eastus"
    allocation_method   = "Static"
    tags = {
      environment = "dev"
      managed_by  = "vv"
    }
  }

  pip2 = {
    pip_name            = "back-pip"
    resource_group_name = "vk-rg"
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
    resource_group_name = "vk-rg"
    sku_name            = "standard"
  }
}

kv_secret = {
  secret1 = {
    kv_secret_name = "font-username"
    secret_value = "vk-admin1"
    kv_name = "vk-vault"
   resource_group_name = "vk-rg"
  }
  secret2 = {
   kv_secret_name = "back-username"
   secret_value = "vk-admin2"
   kv_name = "vk-vault"
   resource_group_name = "vk-rg"
  }
  secret3 = {
   kv_secret_name = "font-password"
   secret_value = "admin@12345"
   kv_name = "vk-vault"
   resource_group_name = "vk-rg"
  }
secret4 = {
   kv_secret_name = "back-password"
   secret_value = "admin@12345"
   kv_name = "vk-vault"
   resource_group_name = "vk-rg"
  }
}
vms = {
  vm1 = {

    nic_name = "nic-font"
    ip_configuration = [
      { ip_name                       = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    ]
    subnet_name                   = "font-subnet"
    vnet_name                     = "vk-vnet"
    kv_name                       = "vk-vault"
    username                      = "font-username"
    password                      = "font-password"
    pip_name                      = "font-pip"
    nic_name                      = "nic-font"
    location                      = "eastus"
    resource_group_name           = "vk-rg"
    admin_username                  = "vk-admin"
    admin_password                  = "admin@12345"
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
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }]
  }

  vm2 = {

    nic_name = "vk-nic"
    ip_configuration = [
      { ip_name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    ]
    subnet_name                   = "back-subnet"
    vnet_name                     = "vk-vnet"
    kv_name                       = "vk-vault"
    username                      = "back-username"
    password                      = "back-password"
    pip_name                      = "back-pip"
    nic_name                      = "vk-nic"
    location                      = "eastus"
    resource_group_name           = "vk-rg"
    ip_name                       = "back-ip"
    private_ip_address_allocation = "Dynamic"
    vm_name                       = "back-vm"
    admin_username                  = "vk-admin"
    admin_password                  = "admin@12345"
    size                          = "Standard_D2s_v3"
    os_disk = [
      {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    ]
    source_image_reference = [{
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }]
  }
}