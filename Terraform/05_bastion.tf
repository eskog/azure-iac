#ExternalNIC
resource "azurerm_network_interface" "externalnic" {
  name                = "external-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.bastionip.id
  }
}

resource "azurerm_linux_virtual_machine" "bastion01" {
  name                = "bastion01"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B1s"
  admin_username      = "skogen"
  network_interface_ids = [
    azurerm_network_interface.externalnic.id,
  ]

  admin_ssh_key {
    username   = "skogen"
    public_key = file(var.ssh_key)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
  tags = {
    OS   = "Ubuntu"
    role = "bastion"
  }
}