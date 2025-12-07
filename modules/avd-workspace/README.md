# AVD Workspace Module

This module creates an Azure Virtual Desktop workspace and optionally associates existing application groups with the workspace.

## Usage

```
module "avd_workspace" {
  source              = "../modules/avd-workspace"
  name                = "example-workspace"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  friendly_name       = "Example Workspace"
  application_group_ids = [azurerm_virtual_desktop_application_group.app1.id]
}
```

## Inputs

- `name` (string) - workspace name
- `resource_group_name` (string) - RG name
- `location` (string) - location
- `friendly_name` (string) - friendly display name
- `description` (string) - optional description
- `tags` (map) - tags to apply
- `application_group_ids` (list(string)) - optional list of application group IDs to associate

## Outputs

- `workspace_id` - ID of the created workspace
- `workspace_name` - Name of the created workspace
