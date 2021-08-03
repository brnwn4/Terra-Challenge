variable "name" {
  description = "The name of the subnet. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the subnet. Changing this forces a new resource to be created."
}
variable "virtual_network_name" {
  description = "The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created."
}
variable "address_prefixes" {
  description = "The address prefixes to use for the subnet."
}


resource "azurerm_subnet" "subnet" {
  name                 = var.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes
}


output "subnet_name" {
  value = azurerm_subnet.subnet.name
}
output "id" {
  value = azurerm_subnet.subnet.id
}
output "subnet_resource_group_name" {
  value = azurerm_subnet.subnet.resource_group_name
}
output "subnet_vnetname" {
  value = azurerm_subnet.subnet.virtual_network_name
}
output "subnet_addressprefixes" {
  value = azurerm_subnet.subnet.address_prefixes
}