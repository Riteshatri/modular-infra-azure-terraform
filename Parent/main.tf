module "resource_group" {
  source                  = "../azurerm_resource_group"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}

module "virtual_network" {
  source               = "../azurerm_virtual_network"
  virtual_network_name = var.virtual_network_name
  resource_group_name  = module.resource_group.resource_group_name
  address_space        = var.virtual_network_address_space
  depends_on           = [module.resource_group]
}

module "frontend_subnet" {
  source               = "../azurerm_subnet"
  subnet_name          = var.frontend_subnet_name
  resource_group_name  = module.resource_group.resource_group_name
  virtual_network_name = module.virtual_network.vnet_name_output_b
  address_prefixes     = var.frontend_subnet_prefixes
  depends_on           = [module.virtual_network]
}

module "backend_subnet" {
  source               = "../azurerm_subnet"
  subnet_name          = var.backend_subnet_name
  resource_group_name  = module.resource_group.resource_group_name
  virtual_network_name = module.virtual_network.vnet_name_output_b
  address_prefixes     = var.backend_subnet_prefixes
  depends_on           = [module.virtual_network]
}

module "frontend-public-ip" {
  source              = "../azurerm_public_ip"
  pip_name            = var.frontend_public_ip_name
  resource_group_name = module.resource_group.resource_group_name
  depends_on          = [module.resource_group]
}

module "frontend-network-security-group" {
  source                      = "../azurerm_network_security_group"
  network_security_group_name = var.frontend_nsg_name
  resource_group_name         = module.resource_group.resource_group_name
  allowed_ports               = var.frontend_nsg_allowed_ports
  depends_on                  = [module.resource_group]
}

module "frontend_network_interface" {
  source                                  = "../azurerm_network_interface"
  network_interface_name                  = var.frontend_nic_name
  resource_group_name                     = module.resource_group.resource_group_name
  network_interface_ip_configuration_name = var.frontend_nic_ip_config_name
  public_ip                               = module.frontend-public-ip.public_ip_address
  virtual_network_name                    = module.virtual_network.vnet_name_output_b
  subnet_name                             = module.frontend_subnet.subnet_id
  network_security_group_name             = module.frontend-network-security-group.nsg_id
  depends_on                              = [module.frontend_subnet]
}

module "frontend-vm" {
  source                    = "../azurerm_linux_virtual_machine"
  vm_name                   = var.frontend_vm_name
  resource_group_name       = module.resource_group.resource_group_name
  key_vault_name            = module.azurerm_key_vault_module.key_vault_name_output_block
  vm_admin_username_secret  = module.azurerm_key_vault_secrets_module.frontend_vm_admin_username
  vm_admin_pass_secret_name = module.azurerm_key_vault_secrets_module.frontend_vm_admin_password
  vm_size                   = var.frontend_vm_size
  vm_publisher              = var.frontend_vm_publisher
  vm_offer                  = var.frontend_vm_offer
  vm_sku                    = var.frontend_vm_sku
  vm_version                = var.frontend_vm_version
  network_interface_name    = module.frontend_network_interface.network_interface_name_output_block
  depends_on                = [module.frontend_network_interface, module.azurerm_key_vault_module, module.azurerm_key_vault_secrets_module]
}

module "backend-public-ip" {
  source              = "../azurerm_public_ip"
  pip_name            = var.backend_public_ip_name
  resource_group_name = module.resource_group.resource_group_name
  depends_on          = [module.resource_group]
}

module "backend-network-security-group" {
  source                      = "../azurerm_network_security_group"
  network_security_group_name = var.backend_nsg_name
  resource_group_name         = module.resource_group.resource_group_name
  allowed_ports               = var.backend_nsg_allowed_ports
  depends_on                  = [module.resource_group]
}

module "backend_network_interface" {
  source                                  = "../azurerm_network_interface"
  network_interface_name                  = var.backend_nic_name
  resource_group_name                     = module.resource_group.resource_group_name
  network_interface_ip_configuration_name = var.backend_nic_ip_config_name
  public_ip                               = module.backend-public-ip.public_ip_address
  virtual_network_name                    = module.virtual_network.vnet_name_output_b
  subnet_name                             = module.backend_subnet.subnet_id
  network_security_group_name             = module.backend-network-security-group.nsg_id
  depends_on                              = [module.backend_subnet]
}

module "backend-vm" {
  source                    = "../azurerm_linux_virtual_machine"
  vm_name                   = var.backend_vm_name
  resource_group_name       = module.resource_group.resource_group_name
  key_vault_name            = module.azurerm_key_vault_module.key_vault_name_output_block
  vm_admin_username_secret  = module.azurerm_key_vault_secrets_module.backend_vm_admin_username
  vm_admin_pass_secret_name = module.azurerm_key_vault_secrets_module.backend_vm_admin_password
  vm_size                   = var.backend_vm_size
  network_interface_name    = module.backend_network_interface.network_interface_name_output_block
  vm_publisher              = var.backend_vm_publisher
  vm_offer                  = var.backend_vm_offer
  vm_sku                    = var.backend_vm_sku
  vm_version                = var.backend_vm_version
  depends_on                = [module.backend_network_interface, module.azurerm_key_vault_module, module.azurerm_key_vault_secrets_module]
}

module "sql_server_module" {
  source                        = "../azurerm_sql_server"
  resource_group_name           = module.resource_group.resource_group_name
  key_vault_name                = module.azurerm_key_vault_module.key_vault_name_output_block
  sql_server_admin_login_key    = module.azurerm_key_vault_secrets_module.sql_server_admin_login_username
  sql_server_admin_password_key = module.azurerm_key_vault_secrets_module.sql_server_admin_password
  sql_server_name               = var.sql_server_name
  depends_on                    = [module.resource_group, module.azurerm_key_vault_secrets_module, module.azurerm_key_vault_module]
}

module "sql_database_module" {
  source              = "../azurerm_sql_database"
  sql_database_name   = var.sql_database_name
  mssql_server_name   = module.sql_server_module.sql_server_output_block
  resource_group_name = module.resource_group.resource_group_name
  depends_on          = [module.sql_server_module]
}

module "azurerm_key_vault_module" {
  source              = "../azurerm_key_vault"
  resource_group_name = module.resource_group.resource_group_name
  key_vault_name      = var.key_vault_name
  depends_on          = [module.resource_group]
}

module "azurerm_key_vault_secrets_module" {
  source              = "../azurerm_key_vault_secrets"
  resource_group_name = module.resource_group.resource_group_name
  key_vault_name      = module.azurerm_key_vault_module.key_vault_name_output_block

  frontend_vm_admin_username_key   = var.frontend_vm_admin_username_key
  frontend_vm_admin_username_value = var.frontend_vm_admin_username_value
  frontend_vm_admin_password_key   = var.frontend_vm_admin_password_key
  frontend_vm_admin_password_value = var.frontend_vm_admin_password_value

  backend_vm_admin_username_key   = var.backend_vm_admin_username_key
  backend_vm_admin_username_value = var.backend_vm_admin_username_value
  backend_vm_admin_password_key   = var.backend_vm_admin_password_key
  backend_vm_admin_password_value = var.backend_vm_admin_password_value

  sql_server_admin_login_key      = var.sql_server_admin_login_key
  sql_server_admin_login_value    = var.sql_server_admin_login_value
  sql_server_admin_password_key   = var.sql_server_admin_password_key
  sql_server_admin_password_value = var.sql_server_admin_password_value

  depends_on = [module.azurerm_key_vault_module]
}
