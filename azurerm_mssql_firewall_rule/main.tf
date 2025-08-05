data "azurerm_resource_group" "resource_group_data_block" {
  name = var.resource_group_name
}

data "azurerm_mssql_server" "sql_server_data_block" {
  name                = var.sql_server_name
  resource_group_name = data.azurerm_resource_group.resource_group_data_block.name
}



resource "azurerm_mssql_firewall_rule" "backend_vm_firewall_rule" {
  name                = "Allow-Backend-VM-IP"
  server_id           = data.azurerm_mssql_server.sql_server_data_block.id
  start_ip_address    = var.backend_public_ip_address
  end_ip_address      = var.backend_public_ip_address
  
}
