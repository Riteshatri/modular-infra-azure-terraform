resource "azurerm_mssql_firewall_rule" "resource_firewall_rule" {
  name                = var.firewall_rule_name
  server_id           = var.sql_server_id
  start_ip_address    = var.start_ip
  end_ip_address      = var.end_ip
}

