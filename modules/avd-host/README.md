# AVD Host Registration Module

This module registers existing Azure VMs as session hosts in an Azure Virtual Desktop (AVD) Host Pool using the
`azurerm_virtual_desktop_session_host` resource. It does not create VMs — it only creates the registration records
for VMs that already exist.

## Usage

Example:

```
module "avd_host_registration" {
  source               = "../modules/avd-host"
  host_pool_id         = azurerm_virtual_desktop_host_pool.example.id
  resource_group_name  = azurerm_resource_group.rg.name
  register_session_hosts = true
  session_hosts = [
    { name = "vm-1" , azure_vm_id = azurerm_windows_virtual_machine.vm1.id },
    { name = "vm-2" , azure_vm_id = azurerm_windows_virtual_machine.vm2.id },
  ]
}
```

## Inputs

- `host_pool_id` (string) - ID of the AVD host pool.
- `resource_group_name` (string) - RG where registrations will be created.
- `register_session_hosts` (bool) - Whether to perform registrations (default: false).
- `session_hosts` (list(object)) - List of { name, azure_vm_id } entries.

## Outputs

- `session_host_ids` - List of created registration resource IDs.
- `session_host_names` - List of created session host names.
