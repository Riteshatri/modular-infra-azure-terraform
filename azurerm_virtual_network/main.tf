data "azurerm_resource_group" "resource_group_data_block" {
  name = var.resource_group_name
}


resource "azurerm_virtual_network" "virtual_network" {
  name                = var.virtual_network_name
  location            = data.azurerm_resource_group.resource_group_data_block.location
  resource_group_name = data.azurerm_resource_group.resource_group_data_block.name
  address_space       = var.address_space
}