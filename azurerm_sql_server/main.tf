data "azurerm_resource_group" "resource_group_data_block" {
  name = var.resource_group_name
}

data "azurerm_key_vault" "key_vault_data_block" {
  name                = var.key_vault_name
  resource_group_name = data.azurerm_resource_group.resource_group_data_block.name
}

data "azurerm_key_vault_secret" "sql_server_admin_login_secret_data_block" {
  name         = var.sql_server_admin_login_key
  key_vault_id = data.azurerm_key_vault.key_vault_data_block.id
}

data "azurerm_key_vault_secret" "sql_server_admin_password_data_block" {
  name         = var.sql_server_admin_password_key
  key_vault_id = data.azurerm_key_vault.key_vault_data_block.id
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = data.azurerm_resource_group.resource_group_data_block.name
  location                     = data.azurerm_resource_group.resource_group_data_block.location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.sql_server_admin_login_secret_data_block.value
  administrator_login_password = data.azurerm_key_vault_secret.sql_server_admin_password_data_block.value
}