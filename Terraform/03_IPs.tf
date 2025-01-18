resource "azurerm_public_ip" "bastionip" {
  name                = "bastionip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    environment = "Production"
  }
}