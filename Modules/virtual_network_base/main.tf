variable "name" {
  description = "The name of the virtual network. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
}
variable "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
  default     = "East US 2"
}
variable "address_space" {
  description = "The address space that is used the virtual network. You can supply more than one address space."
}
variable "dns_servers" {
  description = "List of IP addresses of DNS servers"
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  tags                = var.tags
}
output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}
output "vnet_location" {
  value = azurerm_virtual_network.vnet.location
}
output "vnet_resource_group_name" {
  value = azurerm_virtual_network.vnet.resource_group_name
}
output "vnet_addressspace" {
  value = azurerm_virtual_network.vnet.address_space
}
output "vnet_dnsservers" {
  value = azurerm_virtual_network.vnet.dns_servers
}
output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}