# Storage Account for FSLogix Profiles

This module creates an Azure Storage account (StorageV2) and an Azure Files share intended to host FSLogix roaming profiles for AVD session hosts.

Key features:
- Provision a StorageV2 account with network rules (IP rules or subnet restrictions)
- Create an Azure Files share with configurable quota

Usage example:

```
module "fslogix_storage" {
  source              = "../modules/storage-account-fslogix"
  name                = "stfslogix001"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  account_tier        = "Standard"
  account_replication_type = "LRS"
  network_default_action = "Deny"
  virtual_network_subnet_ids = [module.network.subnet_id]
  share_name          = "fslogix-profiles"
  share_quota_gb      = 512
}
```

Notes:
- Ensure the storage account name meets Azure naming rules (lowercase, 3-24 chars, unique).
- For production FSLogix workloads consider Premium Files (if needed) for performance.
