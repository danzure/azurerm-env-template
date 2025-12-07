# AVD Host Pool module

This module creates an Azure Virtual Desktop (AVD) host pool and optional application group and session host registrations.

Key features
- Create an AVD host pool (`azurerm_virtual_desktop_host_pool`).
- Optionally create an application group (`azurerm_virtual_desktop_application_group`).
- Optionally register existing VMs as session hosts using `azurerm_virtual_desktop_session_host`.

Inputs
- `name`, `resource_group_name`, `location`, `host_pool_type`, `load_balance_algorithm`, `tags`, etc. See `variables.tf`.

Outputs
- `host_pool_id`, `host_pool_name`, `application_group_id`, `session_host_ids`.

Notes
- This module does not provision VM session hosts (VMs) by default; provide `session_hosts` with VM resource IDs if you want registration handled here.
- Registration requires the AVD agent to be present on the VM image and appropriate networking to the AVD control plane.
