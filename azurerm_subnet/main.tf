data "azurerm_resource_group" "resource_group_data_block" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "virtual_network_data_block" {
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.resource_group_data_block.name
  virtual_network_name = data.azurerm_virtual_network.virtual_network_data_block.name
  address_prefixes     = var.address_prefixes
}
