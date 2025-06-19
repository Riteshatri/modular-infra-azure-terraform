data "azurerm_resource_group" "resource_group_data_block" {
  name = var.resource_group_name
}

data "azurerm_mssql_server" "mssql_server_data_block" {
  name                = var.mssql_server_name
  resource_group_name = data.azurerm_resource_group.resource_group_data_block.name
}


resource "azurerm_mssql_database" "sql_database" {
  name         = var.sql_database_name
  server_id    = data.azurerm_mssql_server.mssql_server_data_block.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
}