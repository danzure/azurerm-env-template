variable "name" {
  description = "Storage account name (must be globally unique, lowercase)"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name for the storage account"
  type        = string
}

variable "location" {
  description = "Location for the storage account"
  type        = string
}

variable "account_tier" {
  description = "Storage account tier (Standard/Premium)"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Replication type (LRS, GRS, ZRS, etc.)"
  type        = string
  default     = "LRS"
}

variable "network_default_action" {
  description = "Default network action for the storage account network rules (Allow/Deny)"
  type        = string
  default     = "Allow"
}

variable "ip_rules" {
  description = "List of IP rules allowed to access the storage account"
  type        = list(string)
  default     = []
}

variable "virtual_network_subnet_ids" {
  description = "List of subnet IDs allowed to access the storage account"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}

variable "share_name" {
  description = "Azure Files share name to host FSLogix profiles"
  type        = string
  default     = "fslogix-profiles"
}

variable "share_quota_gb" {
  description = "Share quota in GB"
  type        = number
  default     = 512
}
