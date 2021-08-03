# variable "location" {
#     description = "Where the resource resides"
# }       
# variable "name" {
#   description = "The name of the virtual network. Changing this forces a new resource to be created."
# }
# variable "resource_group_name" {
#   description = "The name of the resource group in which to create the virtual network."
# }
# variable "addressspace" {
#   type = string
#   description = "The address space that is used the virtual network. You can supply more than one address space."
# }
# variable "dnsservers" {
#   type = string
#   description = "List of IP addresses of DNS servers"
# }
# variable "tags" {
#   type        = map(string)
#   description = "A map of the tags to use on the resources that are deployed with this module."
# }