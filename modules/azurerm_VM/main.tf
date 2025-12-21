resource "azurerm_network_interface" "vv-nic" {

  for_each            = var.vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "ip_configuration" {

    for_each = each.value.ip_configuration

    content {
      name                          = ip_configuration.value.ip_name
      subnet_id                     = data.azurerm_subnet.subnet[each.key].id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      public_ip_address_id          = data.azurerm_public_ip.pipids[each.key].id
    }

  }

}

resource "azurerm_linux_virtual_machine" "vv-vm" {
    for_each                        = var.vms
  name                            = each.value.vm_name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.username[each.key].value
  admin_password                  = data.azurerm_key_vault_secret.password[each.key].value
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.vv-nic[each.key].id, ]

  dynamic "admin_ssh_key" {

    for_each = each.value.admin_ssh_key == null ? [] : [each.value.admin_ssh_key]

    content {
      username   = admin_ssh_key.value.username
      public_key = admin_ssh_key.value.public_key

    }

  }

  dynamic "os_disk" {

    for_each = each.value.os_disk
    content {
      caching              = os_disk.value.caching
      storage_account_type = os_disk.value.storage_account_type

    }

  }

  dynamic "source_image_reference" {
    for_each = each.value.source_image_reference
    content {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }

  }
}
