output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}
output "external_ip" {
  value = azurerm_public_ip.bastionip.ip_address
}