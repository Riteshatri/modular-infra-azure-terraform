# output "frontend_vm_admin_password_secret_name_output_block" {
#   value = azurerm_key_vault_secret.frontend_vm_admin_password_secret.name
# }

# output "backend_vm_admin_password_secret_name_output_block" {
#   value = azurerm_key_vault_secret.backend_vm_admin_password_secret.name
# }
output "frontend_vm_admin_username" {
  value = azurerm_key_vault_secret.frontend_vm_admin_username_secret.name
}

output "frontend_vm_admin_password" {
  value = azurerm_key_vault_secret.frontend_vm_admin_password_secret.name
}

output "backend_vm_admin_username" {
  value = azurerm_key_vault_secret.backend_vm_admin_username_secret.name
}

output "backend_vm_admin_password" {
  value = azurerm_key_vault_secret.backend_vm_admin_password_secret.name
}

output "sql_server_admin_login_username" {
  value = azurerm_key_vault_secret.sql_server_admin_login_secret.name
}

output "sql_server_admin_password" {
  value = azurerm_key_vault_secret.sql_server_admin_password.name
}