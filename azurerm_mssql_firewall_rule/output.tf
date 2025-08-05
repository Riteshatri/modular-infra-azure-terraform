output "firewall_rule_name" {
  value = azurerm_mssql_firewall_rule.backend_vm_firewall_rule.name
}
