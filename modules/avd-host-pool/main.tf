resource "azurerm_virtual_desktop_host_pool" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  type          = var.host_pool_type
  friendly_name = var.friendly_name
  description   = var.description

  load_balancer_type = var.load_balance_algorithm

  tags = var.tags
}

resource "azurerm_virtual_desktop_application_group" "this" {
  count               = var.application_group_type != "" ? 1 : 0
  name                = "${var.name}-ag"
  resource_group_name = var.resource_group_name
  location            = var.location
  host_pool_id        = azurerm_virtual_desktop_host_pool.this.id
  type                = var.application_group_type
  tags                = var.tags
}

/*
Note: Registering session hosts (VMs) normally requires the AVD agent and to be executed on the VM.
This module can accept a list of VM resource IDs to create registrations via the 'azurerm_virtual_desktop_session_host'
resource if desired, but many operators prefer to provision VMs in a separate module and register them using extensions
or by calling the AVD agent during image provisioning. For completeness we provide a simple registration flow below when
'register_session_hosts' is true and 'session_hosts' is supplied.
*/

resource "azurerm_virtual_desktop_session_host" "hosts" {
  count               = var.register_session_hosts ? length(var.session_hosts) : 0
  host_pool_id        = azurerm_virtual_desktop_host_pool.this.id
  resource_group_name = var.resource_group_name
  name                = var.session_hosts[count.index].name
  session_host_vm_id  = var.session_hosts[count.index].azure_vm_id
}
