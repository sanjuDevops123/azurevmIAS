resource "azurerm_network_security_group" "TestNSG" {
  name                = "Util_stop_NSG"
  location            = azurerm_resource_group.TestRG.location
  resource_group_name = azurerm_resource_group.TestRG.name
}

resource "azurerm_network_security_rule" "inbound_rule_22" {
  name                        = "Allow-SSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.TestRG.name
  network_security_group_name = azurerm_network_security_group.TestNSG.name
}

resource "azurerm_network_security_rule" "inbound_rule_80" {
  name                        = "Allow-HTTP"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.TestRG.name
  network_security_group_name = azurerm_network_security_group.TestNSG.name
}

resource "azurerm_network_security_rule" "inbound_rule_443" {
  name                        = "Allow-HTTPS"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.TestRG.name
  network_security_group_name = azurerm_network_security_group.TestNSG.name
}

resource "azurerm_network_security_rule" "inbound_rule_3000_3010" {
  name                        = "Allow-application_port-range-3000-3010"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3000-3010"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.TestRG.name
  network_security_group_name = azurerm_network_security_group.TestNSG.name
}

resource "azurerm_network_security_rule" "outbound_rule_65000" {
  name                        = "Allow-Outbound-65000"
  priority                    = 200
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "65000"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.TestRG.name
  network_security_group_name = azurerm_network_security_group.TestNSG.name
}

resource "azurerm_network_security_rule" "outbound_rule_65001" {
  name                        = "Allow-Outbound-65001"
  priority                    = 201
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "65001"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.TestRG.name
  network_security_group_name = azurerm_network_security_group.TestNSG.name
}

resource "azurerm_network_security_rule" "outbound_rule_65500" {
  name                        = "Allow-Outbound-65500"
  priority                    = 202
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "65500"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.TestRG.name
  network_security_group_name = azurerm_network_security_group.TestNSG.name
}
