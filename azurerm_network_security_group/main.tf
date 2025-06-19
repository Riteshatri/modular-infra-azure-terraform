data "azurerm_resource_group" "resource_group_data_block" {
  name = var.resource_group_name
}


resource "azurerm_network_security_group" "rit_nsg" {
  name                = var.network_security_group_name
  location            = data.azurerm_resource_group.resource_group_data_block.location
  resource_group_name = data.azurerm_resource_group.resource_group_data_block.name
}

resource "azurerm_network_security_rule" "allow_ssh" {
  count                       = length(var.allowed_ports)
  name                        = "Allow-Port-${var.allowed_ports[count.index]}" # "Allow-SSH"
  priority                    = 1000 + count.index                             # Lower number = higher priority
  direction                   = "Inbound"                                      # Incoming traffic
  access                      = "Allow"                                        # Allow it
  protocol                    = "Tcp"                                          # SSH runs on TCP
  source_port_range           = "*"                                            # From any source port
  destination_port_range      = var.allowed_ports[count.index]                 # Target is port 22
  source_address_prefix       = "*"                                            # Allow from any IP
  destination_address_prefix  = "*"                                            # To any destination
  resource_group_name         = data.azurerm_resource_group.resource_group_data_block.name
  network_security_group_name = azurerm_network_security_group.rit_nsg.name
  depends_on                  = [azurerm_network_security_group.rit_nsg]
}
