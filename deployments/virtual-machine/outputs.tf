output "vm_id" {
  description = "ID of the deployed VM"
  value       = module.win_vm.vm_id
}

output "vm_public_ip" {
  description = "Public IP address of the VM if created"
  value       = module.win_vm.public_ip_address
}
