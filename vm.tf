resource "azurerm_resource_group" "TestRG" {
  name     = "util_stop"
  location = "East US"
}

resource "azurerm_virtual_network" "TestVN" {
  name                = "Util_stop_Vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.TestRG.location
  resource_group_name = azurerm_resource_group.TestRG.name
}

resource "azurerm_subnet" "TestSN" {
  name                 = "Util_stop_SN"
  resource_group_name  = azurerm_resource_group.TestRG.name
  virtual_network_name = azurerm_virtual_network.TestVN.name
  address_prefixes     = ["10.0.2.0/24"]

  depends_on = [azurerm_virtual_network.TestVN]
}

resource "azurerm_public_ip" "testuspi" {
  name = "Util_Publicip"
  location = azurerm_resource_group.TestRG.location 
  resource_group_name = azurerm_resource_group.TestRG.name
  allocation_method = "Dynamic"
}

resource "azurerm_network_interface" "TestNIC" {
  name                = "Util_NIC"
  location            = azurerm_resource_group.TestRG.location
  resource_group_name = azurerm_resource_group.TestRG.name

  ip_configuration {
    name                          = "util_stop"
    subnet_id                     = azurerm_subnet.TestSN.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.testuspi.id
  }

  depends_on = [azurerm_subnet.TestSN]
}

resource "azurerm_network_interface_security_group_association" "TestNICAssosiation" {
  network_interface_id = azurerm_network_interface.TestNIC.id
  network_security_group_id = azurerm_network_security_group.TestNSG.id
}

resource "azurerm_linux_virtual_machine" "UtilstopVM" {
  name                  = "Utilstoptest"
  resource_group_name   = azurerm_resource_group.TestRG.name
  location              = azurerm_resource_group.TestRG.location
  size                  = "Standard_B2s"
  admin_username        = "azureuser"
  admin_password        = "Flaplive@123"

  network_interface_ids = [
    azurerm_network_interface.TestNIC.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  disable_password_authentication = false

  depends_on = [azurerm_network_interface.TestNIC]
}
