variable "name" {
  description = "Name of the AVD workspace"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name for the workspace"
  type        = string
}

variable "location" {
  description = "Location for the workspace"
  type        = string
}

variable "description" {
  description = "Description for the workspace"
  type        = string
  default     = ""
}

variable "friendly_name" {
  description = "Friendly name for the workspace"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to the workspace"
  type        = map(string)
  default     = {}
}

variable "application_group_ids" {
  description = "Optional list of application group IDs to associate with the workspace"
  type        = list(string)
  default     = []
}
