#locals
locals {
  resource_group_name = "terraformlab"
  location            = "eastus"
  tags = {
    "createdby" = "brandon_wong"
    "Tool"      = "Terraform"
  }
  vnetname                = "terraformlab-vnet"
  addressspace            = "10.10.0.0/16"
  dnsservers              = "8.8.8.8"
  subnetname              = "terraformlabsubnet"
  subnet_address_prefixes = "10.10.10.0/24"
  allocation_method       = "Static"
  pip_name                = "linux_vm"
  vmname                  = "tf-linux-vm"
  nsgname                 = "tf-nsg"
  priority      = "201"
  direction     = "Inbound"
  access    = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "80"
  destination_port_range      = "80"
  source_address_prefixes     = "*"
  destination_address_prefix  = "*"
  rulename  = "allow80"
  subnet_depends_on = module.checkpoint-vnet
  host = module.linux-vm
}
module "checkpoint-rg" {
  source              = "../Modules/RG"
  resource_group_name = local.resource_group_name
  location            = local.location
  tags                = local.tags
}
module "checkpoint-vnet" {
  source              = "../Modules/virtual_network_base"
  name                = local.vnetname
  location            = local.location
  resource_group_name = module.checkpoint-rg.name
  address_space       = [local.addressspace]
  dns_servers         = [local.dnsservers]
  tags                = local.tags
}
module "checkpoint-subnet" {
  source               = "../Modules/subnet_base"
  name                 = local.subnetname
  resource_group_name  = module.checkpoint-rg.name
  virtual_network_name = local.vnetname
  address_prefixes     = [local.subnet_address_prefixes]
  depends_on = [module.checkpoint-vnet]
}
module "linux-vm" {
  source              = "../Modules/linux_vm"
  name                = local.vmname
  resource_group_name = module.checkpoint-rg.name
  location            = local.location
  tags                = local.tags
  subnet_id           = module.checkpoint-subnet.id
  depends_on = [
  module.checkpoint-vnet,
  module.tflab-nsg
  ]
}
module "tflab-nsg" {
  source              = "../Modules/nsg"
  name                        = local.nsgname
  resource_group_name         = module.checkpoint-rg.name
  location            = local.location
  tags                = local.tags
}
module "nsg_assoc" {
    source = "../Modules/nsg-assoc"
    subnet_id                 = module.checkpoint-subnet.id
    network_security_group_id = module.tflab-nsg.id
    depends_on = [
    module.checkpoint-vnet,
    module.tflab-nsg
    ]
}