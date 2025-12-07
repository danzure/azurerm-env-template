resource "azurerm_virtual_desktop_session_host" "this" {
  count               = var.register_session_hosts ? length(var.session_hosts) : 0
  host_pool_id        = var.host_pool_id
  resource_group_name = var.resource_group_name
  name                = var.session_hosts[count.index].name
  session_host_vm_id  = var.session_hosts[count.index].azure_vm_id
  depends_on          = var.depends_on
}
