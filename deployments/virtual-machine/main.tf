provider "azurerm" {
	features {

    }
}

module "spoke_vnet2" {
  source = "../../modules/spoke-vnet"
}

module "win_vm" {
	source              = "../../modules/win-vm"
	vm_name             = "demo-winvm-01"
	resource_group_name = azurerm_resource_group.rg.name
	location            = azurerm_resource_group.rg.location
	subnet_id           = azurerm_subnet.subnet.id

	# Credentials - keep admin_password secure (see variables.tf)
	admin_username = "azureadmin"
	admin_password = var.admin_password

	# Optional settings
	create_public_ip = true
	size             = "Standard_DS1_v2"

	tags = {
		project = "demo"
		env     = "dev"
	}
}

output "vm_id" {
	value = module.win_vm.vm_id
}

output "vm_public_ip" {
	value = module.win_vm.public_ip_address
}

