data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "resource_group_data_block" {
  name = var.resource_group_name
}


resource "azurerm_key_vault" "key_vault_resource_block" {
  name                        = var.key_vault_name
  location                    = data.azurerm_resource_group.resource_group_data_block.location
  resource_group_name         = data.azurerm_resource_group.resource_group_data_block.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"

  soft_delete_retention_days = 7
  enabled_for_disk_encryption = true
  purge_protection_enabled    = true
  enabled_for_deployment      = true
  enable_rbac_authorization   = true
  enabled_for_template_deployment = true
}
