variable "resource_group_name" {
  description = "A name for this resource group"
}
variable "location" {
  description = "Azure location for deployment"
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}

resource "azurerm_resource_group" "rg" {
  name      = var.resource_group_name
  location  = var.location
  tags      = var.tags
}

output "name" {
  value = azurerm_resource_group.rg.name
}
output "location" {
  value = azurerm_resource_group.rg.location
}
output "id" {
  value = azurerm_resource_group.rg.id
}