# variable "name" {
#   description = "Specifies the name of the Network Interface. Changing this forces a new resource to be created"
# }
# variable "location" {
#   description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
#   default     = "East US 2"
# }
# variable "resource_group_name" {
#   description = "The name of the resource group in which to create the Network Interface. Changing this forces a new resource to be created."
# }
# variable "allocation_method" {
#   description = "Specifies the allocation method of the Public IP. Default is dynamic. "
#   default     = "dynamic"
# }
# variable "tags" {
#   type        = map(string)
#   description = "A map of the tags to use on the resources that are deployed with this module."
# }
# resource "azurerm_public_ip" "public_ip" {
#   name                = "${var.name}-pip"
#   resource_group_name = var.resource_group_name
#   location            = var.location
#   allocation_method   = var.allocation_method

#   tags = var.tags
# }