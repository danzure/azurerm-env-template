resource "azurerm_network_interface" "this" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.create_public_ip ? azurerm_public_ip.this[0].id : null
  }

  tags = var.tags
}

resource "azurerm_public_ip" "this" {
  count               = var.create_public_ip ? 1 : 0
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
  tags                = var.tags
}

resource "azurerm_windows_virtual_machine" "this" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.this.id]
  size                  = var.vm_size

  admin_username = var.admin_username
  admin_password = var.admin_password

  computer_name  = var.computer_name

  os_disk {
    name              = "${var.name}-osdisk"
    caching           = "ReadWrite"
    storage_account_type = var.os_disk_type
    disk_size_gb      = var.os_disk_size_gb
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  identity {
    type = var.identity_type
  }

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "avd_agent" {
  count               = var.install_avd_agent ? 1 : 0
  name                = "AVDAgentExtension"
  virtual_machine_id  = azurerm_windows_virtual_machine.this.id
  publisher           = "Microsoft.Compute"
  type                = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = jsonencode({
    fileUris = var.agent_install_script_urls
    commandToExecute = var.agent_install_command
  })
}
