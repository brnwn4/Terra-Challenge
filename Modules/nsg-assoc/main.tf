variable "subnet_id" {
  description = "The name of the resource group in which to create the Network Security Rule. Changing this forces a new resource to be created."
}
variable "network_security_group_id" {
  description = "The name of the resource group in which to create the Network Security Rule. Changing this forces a new resource to be created."
}
resource "azurerm_subnet_network_security_group_association" "assoc0" {
  subnet_id                 = var.subnet_id
  network_security_group_id = var.network_security_group_id
}