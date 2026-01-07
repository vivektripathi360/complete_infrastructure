rg = {
  rg1 = {
    name       = "vivek-rs-1234"
    location   = "centralindia"
    managed_by = "devopsinsiders"
    tags = {
      dev         = "vivek"
      environment = "Dev"
    }
  }
}

networks = {
  vnet1 = {
    vnet_name           = "vk_vnet323"
    location            = "centralindia"
    resource_group_name = "vivek-rs-1234"
    address_space       = ["10.0.0.0/16"]
    subnet = [
      {
        subnet_name      = "frontend-subnet7"
        address_prefixes = ["10.0.1.0/24"]
      }
      ,
      {
        subnet_name      = "backend-subnet9"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]

  }
}

pips = {

  pip1 = {
    pip_name            = "frontend-pip7"
    resource_group_name = "vivek-rs-1234"
    location            = "centralindia"
    allocation_method   = "Static"
    tags = {
      environment = "dev"
      managed_by  = "vv"
    }
  }

  pip2 = {
    pip_name            = "backend-pip9"
    resource_group_name = "vivek-rs-1234"
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
    kv_name             = "vivek-vlt8345"
    location            = "eastus"
    resource_group_name = "vivek-rs-1234"
    sku_name            = "standard"
  }
}

kv_secret = {
  secret1 = {
    kv_secret_name      = "admin"
    secret_value        = "admin@12345"
    kv_name             = "vivek-vlt8345"
    resource_group_name = "vivek-rs-1234"
  }
  secret2 = {
    kv_secret_name      = "backend-admin"
    secret_value        = "admin@12345"
    kv_name             = "vivek-vlt8345"
    resource_group_name = "vivek-rs-1234"
  }
  secret3 = {
    kv_secret_name      = "frontend-password9"
    secret_value        = "admin@12345"
    kv_name             = "vivek-vlt8345"
    resource_group_name = "vivek-rs-1234"
  }
  secret4 = {
    kv_secret_name      = "backend-password10"
    secret_value        = "admin@12345"
    kv_name             = "vivek-vlt8345"
    resource_group_name = "vivek-rs-1234"
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
    subnet_name                   = "frontend-subnet7"
    vnet_name                     = "vk_vnet323"
    kv_name                       = "vivek-vlt8345"
    username                      = "admin"
    password                      = "frontend-password9"
    pip_name                      = "frontend-pip7"
    nic_name                      = "nic-front"
    location                      = "centralindia"
    resource_group_name           = "vivek-rs-1234"
    admin_username                = "devopsadmin"
    admin_password                = "admin@1234567"
    ip_name                       = "frontend-ip7"
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
    subnet_name                   = "backend-subnet9"
    vnet_name                     = "vk_vnet323"
    kv_name                       = "vivek-vlt8345"
    username                      = "backend-password10"
    password                      = "backend-password10"
    pip_name                      = "backend-pip9"
    nic_name                      = "nic-back"
    location                      = "centralindia"
    resource_group_name           = "vivek-rs-1234"
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

