variable "name" {
  description = "Name of the AVD host pool"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for the AVD resources"
  type        = string
}

variable "location" {
  description = "Azure location for the AVD resources"
  type        = string
}

variable "friendly_name" {
  description = "Display name for the Host Pool"
  type        = string
  default     = null
}

variable "description" {
  description = "Optional description for the Host Pool"
  type        = string
  default     = null
}

variable "host_pool_type" {
  description = "Type of host pool: 'Pooled' or 'Personal'"
  type        = string
  default     = "Pooled"
}

variable "load_balance_algorithm" {
  description = "Load balancing algorithm for pooled host pools"
  type        = string
  default     = "BreadthFirst"
}

variable "validation_environment" {
  description = "Whether the host pool is created as a validation environment"
  type        = bool
  default     = false
}

variable "max_sessions_limit" {
  description = "Maximum sessions per session host (optional)"
  type        = number
  default     = null
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "register_session_hosts" {
  description = "Whether to register session hosts as part of this module (if true, provide session host details)"
  type        = bool
  default     = false
}

variable "session_hosts" {
  description = "List of session host objects when register_session_hosts=true. Each object should contain 'name' and 'azure_vm_id'"
  type = list(object({
    name        = string
    azure_vm_id = string
  }))
  default = []
}

variable "application_group_type" {
  description = "Type of application group to create: 'RemoteApp' or 'Desktop' (optional)"
  type        = string
  default     = "Desktop"
}
