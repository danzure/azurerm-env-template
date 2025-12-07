output "session_host_ids" {
  description = "List of created azurerm_virtual_desktop_session_host resource IDs"
  value       = [for s in azurerm_virtual_desktop_session_host.this : s.id]
}

output "session_host_names" {
  description = "List of created session host names"
  value       = [for s in azurerm_virtual_desktop_session_host.this : s.name]
}
