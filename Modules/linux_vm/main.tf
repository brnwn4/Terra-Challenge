# resource "azurerm_network_interface" "linux_nic" {
#   name                = var.name
#   location            = var.location
#   resource_group_name = var.resource_group_name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = var.subnet_id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_linux_virtual_machine" "linuxvm" {
#   name                = var.name
#   resource_group_name = var.resource_group_name
#   location            = var.location
#   size                = "Standard_B2"
#   admin_username      = "adminuser"
#   admin_password      = "thisissofun11!"
#   public_ip_address = var.public_ip_address
#   network_interface_ids = [
#     azurerm_network_interface.linux_nic.id,
#   ]
#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "16.04-LTS"
#     version   = "latest"
#   }
# }