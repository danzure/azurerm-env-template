variable "bastion_subnet_name" {
  description = "Name to use for the Bastion host subnet. Bastion requires its own subnet (e.g., 'AzureBastionSubnet')."
  type        = string
}

variable "bastion_subnet_prefix" {
  description = "CIDR prefix(es) for the Bastion subnet (list). Provide a single prefix appropriate for the subnet size."
  type        = list(string)
}

variable "firewall_subnet_prefix" {
  description = "CIDR prefix(es) for the Azure Firewall subnet. Use a dedicated subnet named 'AzureFirewallSubnet' in the hub."
  type        = list(string)
}

variable "gateway_subnet_prefix" {
  description = "CIDR prefix(es) for the GatewaySubnet. The subnet must be named 'GatewaySubnet' to deploy VPN/ExpressRoute gateways."
  type        = list(string)
}

variable "hub_address_space" {
  description = "Primary address space for the hub virtual network (list of CIDR blocks). Ensure no overlap with spoke VNets."
  type        = list(string)
}

variable "location" {
  description = "Azure region where the hub VNet and associated subnets will be created (e.g., 'uksouth')."
  type        = string
  default = "uksouth"
}

variable "management_subnet_name" {
  description = "Name for the management/shared-services subnet used for tooling and management VMs. Defaults to 'management'."
  type        = string
  default     = "management"
}

variable "management_subnet_prefix" {
  description = "CIDR prefix(es) for the management subnet (list)."
  type        = list(string)
}

variable "resource_group_name" {
  description = "Name of the resource group to create the hub VNet and subnets in."
  type        = string
}

variable "spoke_vnet_peerings" {
  description = "List of spoke VNet peering configurations. Each object should include 'name' and 'remote_vnet_id' and optional flags for forwarding/gateway transit."
  type = list(object({
    name                    = string
    remote_vnet_id          = string
    allow_forwarded_traffic = optional(bool)
    allow_gateway_transit   = optional(bool)
    use_remote_gateways     = optional(bool)
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to created resources as a map of string values."
  type        = map(string)
  default = {
    "name" = "value"
  }
}

variable "virtual_network_name" {
  description = "Name for the hub virtual network resource."
  type        = string
}