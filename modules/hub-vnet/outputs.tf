output "vnet_id" {
  description = "ID of the hub virtual network"
  value       = azurerm_virtual_network.this.id
}

output "vnet_name" {
  description = "Name of the hub virtual network"
  value       = azurerm_virtual_network.this.name
}

output "gateway_subnet_id" {
  description = "ID of the GatewaySubnet"
  value       = azurerm_subnet.gateway.id
}

output "firewall_subnet_id" {
  description = "ID of the AzureFirewallSubnet"
  value       = azurerm_subnet.firewall.id
}

output "management_subnet_id" {
  description = "ID of the management/shared-services subnet"
  value       = azurerm_subnet.management.id
}

output "bastion_subnet_id" {
  description = "ID of the bastion subnet"
  value       = azurerm_subnet.bastion.id
}

output "spoke_peering_ids" {
  description = "Map of spoke peering resource ids keyed by peering name"
  value       = { for k, v in azurerm_virtual_network_peering.to_spokes : k => v.id }
}
