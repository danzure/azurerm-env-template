output "vm_id" {
  description = "ID of the created virtual machine"
  value       = azurerm_windows_virtual_machine.this.id
}

output "vm_name" {
  description = "Name of the VM"
  value       = azurerm_windows_virtual_machine.this.name
}

output "nic_id" {
  description = "ID of the network interface"
  value       = azurerm_network_interface.this.id
}

output "private_ip_address" {
  description = "Private IP assigned to the VM NIC"
  value       = azurerm_network_interface.this.ip_configuration[0].private_ip_address
}
