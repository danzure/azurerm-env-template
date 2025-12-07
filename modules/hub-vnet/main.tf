resource "azurerm_virtual_network" "this" {
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.hub_address_space
  tags                = var.tags
}

# Gateway subnet (must be named exactly "GatewaySubnet")
resource "azurerm_subnet" "gateway" {
  name                 = "GatewaySubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = var.gateway_subnet_prefix
}

# Azure Firewall subnet (must be named exactly "AzureFirewallSubnet")
resource "azurerm_subnet" "firewall" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = var.firewall_subnet_prefix
}

resource "azurerm_subnet" "management" {
  name                 = var.management_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = var.management_subnet_prefix
}

resource "azurerm_subnet" "bastion" {
  name                 = var.bastion_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = var.bastion_subnet_prefix
}

# Optional: create peering entries to spoke VNets
resource "azurerm_virtual_network_peering" "to_spokes" {
  for_each = { for p in var.spoke_vnet_peerings : p.name => p }

  name                      = "${azurerm_virtual_network.this.name}-to-${each.key}"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.this.name
  remote_virtual_network_id = each.value.remote_vnet_id
  allow_forwarded_traffic   = lookup(each.value, "allow_forwarded_traffic", true)
  allow_gateway_transit     = lookup(each.value, "allow_gateway_transit", false)
  use_remote_gateways       = lookup(each.value, "use_remote_gateways", false)
}
