data "azurerm_resource_group" "resource_group_data_block" {
  name = var.resource_group_name
}

data "azurerm_network_interface" "network_interface_data_block" {
  name                = var.network_interface_name
  resource_group_name = data.azurerm_resource_group.resource_group_data_block.name
}

data "azurerm_key_vault" "key_vault_data_block" {
  name                = var.key_vault_name
  resource_group_name = data.azurerm_resource_group.resource_group_data_block.name
}

data "azurerm_key_vault_secret" "key_vault_secret_data_block" {
  name         = var.vm_admin_pass_secret_name
  key_vault_id = data.azurerm_key_vault.key_vault_data_block.id
}

data "azurerm_key_vault_secret" "key_vault_secret_adminusername_data_block" {
  name         = var.vm_admin_username_secret
  key_vault_id = data.azurerm_key_vault.key_vault_data_block.id
}

resource "azurerm_linux_virtual_machine" "rit-vm" {
  name                  = var.vm_name
  resource_group_name   = data.azurerm_resource_group.resource_group_data_block.name
  location              = data.azurerm_resource_group.resource_group_data_block.location
  size                  = var.vm_size
  admin_username        = data.azurerm_key_vault_secret.key_vault_secret_adminusername_data_block.value
  admin_password        = data.azurerm_key_vault_secret.key_vault_secret_data_block.value
  network_interface_ids = [data.azurerm_network_interface.network_interface_data_block.id]
  
    disable_password_authentication = false

  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.vm_publisher
    offer     = var.vm_offer
    sku       = var.vm_sku
    version   = var.vm_version
}
}