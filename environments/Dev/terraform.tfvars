rg = {
  rg1 = {
    name       = "mt-rg"
    location   = "centralindia"
    managed_by = "devopsinsiders"
    tags = {
      dev         = "vivek"
      environment = "Dev"
    }
  }
}

networks = {
  "vnet1" = {
    vnet_name           = "vk_vnet"
    location            = "centralindia"
    resource_group_name = "mt-rg"
    address_space       = ["10.0.0.0/16"]
    subnet = [
      {
        subnet_name      = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      ,
      {
        subnet_name      = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]

  }
}

pips = {

  pip1 = {
    pip_name            = "frontend-pip"
    resource_group_name = "mt-rg"
    location            = "centralindia"
    allocation_method   = "Static"
    tags = {
      environment = "dev"
      managed_by  = "vv"
    }
  }

  pip2 = {
    pip_name            = "backend-pip"
    resource_group_name = "mt-rg"
    location            = "centralindia"
    allocation_method   = "Static"
    tags = {
      environment = "dev"
      managed_by  = "vv"
    }
  }
}

kv = {
  kv = {
    kv_name             = "vk-vault1"
    location            = "centralindia"
    resource_group_name = "mt-rg"
    sku_name            = "standard"
  }
}

kv_secret = {
  secret1 = {
    kv_secret_name      = "frontend-username1"
    secret_value        = "devopsadmin1"
    kv_name             = "vk-vault1"
    resource_group_name = "mt-rg"
  }
  secret2 = {
    kv_secret_name      = "backend-username1"
    secret_value        = "devopsadmin2"
    kv_name             = "vk-vault1"
    resource_group_name = "mt-rg"
  }
  secret3 = {
    kv_secret_name      = "frontend-password1"
    secret_value        = "admin@12345"
    kv_name             = "vk-vault1"
    resource_group_name = "mt-rg"
  }
  secret4 = {
    kv_secret_name      = "backend-password3"
    secret_value        = "admin@12345"
    kv_name             = "vk-vault1"
    resource_group_name = "mt-rg"
  }
}
vms = {
  vm1 = {

    nic_name = "nic-front"
    ip_configuration = [
      { ip_name                       = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    ]
    subnet_name                   = "frontend-subnet"
    vnet_name                     = "vk_vnet"
    kv_name                       = "vk-vault1"
    username                      = "frontend-username"
    password                      = "frontend-password"
    pip_name                      = "frontend-pip"
    nic_name                      = "nic-frontend"
    location                      = "centralindia"
    resource_group_name           = "mt-rg"
    admin_username                = "devopsadmin"
    admin_password                = "admin@12345"
    ip_name                       = "frontend-ip"
    private_ip_address_allocation = "Dynamic"
    vm_name                       = "front-vm"
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

    nic_name = "nic-back"
    ip_configuration = [
      { ip_name                       = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    ]
    subnet_name                   = "backend-subnet"
    vnet_name                     = "vk_vnet"
    kv_name                       = "vk-vault1"
    username                      = "backend-username"
    password                      = "backend-password"
    pip_name                      = "backend-pip"
    nic_name                      = "nic-backend"
    location                      = "centralindia"
    resource_group_name           = "mt-rg"
    ip_name                       = "backend-ip"
    private_ip_address_allocation = "Dynamic"
    vm_name                       = "back-vm"
    admin_username                = "devopsadmin"
    admin_password                = "admin@12345"
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
