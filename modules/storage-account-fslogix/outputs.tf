output "storage_account_id" {
  description = "ID of the storage account"
  value       = azurerm_storage_account.this.id
}

output "storage_account_name" {
  description = "Name of the storage account"
  value       = azurerm_storage_account.this.name
}

output "file_share_name" {
  description = "Azure Files share name used for FSLogix profiles"
  value       = azurerm_storage_share.fslogix.name
}

output "file_share_id" {
  description = "ID of the Azure Files share"
  value       = azurerm_storage_share.fslogix.id
}
