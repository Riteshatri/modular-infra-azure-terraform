# output "public_ip_address" {
#   value = azurerm_public_ip.public_ip.ip_address
# }

# output "public_ip_name" {
#   value = azurerm_public_ip.public_ip.name
# }
# output "public_ip_id" {
#   value = azurerm_public_ip.public_ip.id
# }

output "public_ip_address" {
  value = azurerm_public_ip.public_ip.name
  }

output "public_ip_address_value" {
  value = azurerm_public_ip.public_ip.ip_address
}