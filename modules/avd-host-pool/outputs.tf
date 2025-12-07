output "host_pool_id" {
  description = "ID of the created host pool"
  value       = azurerm_virtual_desktop_host_pool.this.id
}

output "host_pool_name" {
  description = "Name of the host pool"
  value       = azurerm_virtual_desktop_host_pool.this.name
}

output "application_group_id" {
  description = "ID of the application group (if created)"
  value       = try(azurerm_virtual_desktop_application_group.this[0].id, null)
}

output "session_host_ids" {
  description = "List of session host resource ids registered by this module"
  value       = [for s in azurerm_virtual_desktop_session_host.hosts : s.id]
}
