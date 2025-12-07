variable "host_pool_id" {
  description = "ID of the AVD host pool to register session hosts with"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where session host registrations will be created"
  type        = string
}

variable "register_session_hosts" {
  description = "Whether to create azurerm_virtual_desktop_session_host registrations from the session_hosts list"
  type        = bool
  default     = false
}

variable "session_hosts" {
  description = "List of objects describing session hosts to register. Each item should contain 'name' and 'azure_vm_id'"
  type = list(object({
    name        = string
    azure_vm_id = string
  }))
  default = []
}

variable "depends_on" {
  description = "Optional list of resources this registration should depend on"
  type        = list(any)
  default     = []
}
