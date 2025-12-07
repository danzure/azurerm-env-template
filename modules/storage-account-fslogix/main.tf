
resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = "StorageV2"

  network_rules {
    default_action             = var.network_default_action
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }

  tags = var.tags
}

resource "azurerm_storage_share" "fslogix" {
  name               = var.share_name
  storage_account_id = azurerm_storage_account.this.id
  quota              = var.share_quota_gb
}
