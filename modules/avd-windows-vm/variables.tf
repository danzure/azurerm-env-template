variable "name" {
  description = "VM name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for the VM"
  type        = string
}

variable "location" {
  description = "Location for resources"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the VM NIC"
  type        = string
}

variable "nic_name" {
  description = "Name of the network interface"
  type        = string
}

variable "create_public_ip" {
  description = "Whether to create a public IP for the VM"
  type        = bool
  default     = false
}

variable "public_ip_name" {
  description = "Name for the public IP (when created)"
  type        = string
  default     = ""
}

variable "vm_size" {
  description = "VM size"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "admin_username" {
  description = "Admin username for Windows VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for Windows VM"
  type        = string
  sensitive   = true
}

variable "computer_name" {
  description = "Computer name (hostname)"
  type        = string
}

variable "os_disk_type" {
  description = "OS disk storage account type"
  type        = string
  default     = "Premium_LRS"
}

variable "os_disk_size_gb" {
  description = "OS disk size in GB"
  type        = number
  default     = 127
}

variable "image_publisher" {
  description = "Image publisher for source image"
  type        = string
  default     = "MicrosoftWindowsDesktop"
}

variable "image_offer" {
  description = "Image offer"
  type        = string
  default     = "windows-10"
}

variable "image_sku" {
  description = "Image SKU"
  type        = string
  default     = "21h2-avd"
}

variable "image_version" {
  description = "Image version (use latest)"
  type        = string
  default     = "latest"
}

variable "identity_type" {
  description = "Type of identity to assign to the VM (None, SystemAssigned, UserAssigned)"
  type        = string
  default     = "SystemAssigned"
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}

variable "install_avd_agent" {
  description = "Whether to run a custom script extension to install AVD agent or other provisioning steps"
  type        = bool
  default     = false
}

variable "agent_install_script_urls" {
  description = "List of script URLs that the Custom Script Extension should download"
  type        = list(string)
  default     = []
}

variable "agent_install_command" {
  description = "Command that the Custom Script Extension will execute to install agents"
  type        = string
  default     = ""
}
