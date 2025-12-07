resource "azurerm_virtual_desktop_workspace" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  description         = var.description
  friendly_name       = var.friendly_name
  tags                = var.tags
}

resource "azurerm_virtual_desktop_application_group_association" "ag_assoc" {
  count                     = length(var.application_group_ids) > 0 ? length(var.application_group_ids) : 0
  application_group_id      = var.application_group_ids[count.index]
  workspace_id              = azurerm_virtual_desktop_workspace.this.id
}
