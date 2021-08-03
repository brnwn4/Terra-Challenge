variable "name" {
  description = "The name of the security rule. This needs to be unique across all Rules in the Network Security Group. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the Network Security Rule. Changing this forces a new resource to be created."
}
# variable "nsgname" {
#   description = "The name of the Network Security Group that we want to attach the rule to. Changing this forces a new resource to be created."
# }
# variable "priority" {
#   description = "Specifies the priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection. The lower the priority number, the higher the priority of the rule."
# }
# variable "direction" {
#   description = "The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound."
# }
# variable "access" {
#   description = "Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny."
# }
# variable "protocol" {
#   description = "Network protocol this rule applies to. Possible values include Tcp, Udp, Icmp, or * (which matches all)."
# }
# variable "sourceportrange" {
#   description = "Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source_port_ranges is not specified."
# }
# variable "destination_port_range" {
#   description = "Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination_port_ranges is not specified."
# }
# variable "source_address_prefixes" {
#   description = "CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if source_address_prefixes is not specified."
# }
# variable "destination_address_prefix" {
#   description = "CIDR or destination IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. Besides, it also supports all available Service Tags like ‘Sql.WestEurope‘, ‘Storage.EastUS‘, etc. You can list the available service tags with the cli: shell az network list-service-tags --location westcentralus. For further information please see Azure CLI - az network list-service-tags. This is required if destination_address_prefixes is not specified."
# }
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "location" {
  description = "where the resource lives "
}
resource "azurerm_network_security_group" "tf_nsg" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = var.tags
}
resource "azurerm_network_security_rule" "nsg_rule" {
  name                        = "allow_80"
  priority                    = "100"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix    = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.tf_nsg.name
}
resource "azurerm_network_security_rule" "nsg_rule1" {
  name                        = "allow_22"
  priority                    = "101"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix    = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.tf_nsg.name
}
output "nsgruleid" {
  value = azurerm_network_security_rule.nsg_rule.id
}
output "id" {
  value = azurerm_network_security_group.tf_nsg.id
}