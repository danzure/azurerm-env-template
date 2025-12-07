output "workspace_id" {
  description = "ID of the created AVD workspace"
  value       = azurerm_virtual_desktop_workspace.this.id
}

output "workspace_name" {
  description = "Name of the created workspace"
  value       = azurerm_virtual_desktop_workspace.this.name
}
