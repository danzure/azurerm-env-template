# windows-vm-avd

Module to create a Windows virtual machine tailored for Azure Virtual Desktop (AVD) session hosts.

Features:
- Network interface and optional public IP
- Windows VM from marketplace AVD images
- System-assigned identity (optional)
- Optional Custom Script Extension to run agent/install scripts

Inputs (select):
- name, resource_group_name, location
- subnet_id, nic_name
- vm_size, admin_username, admin_password
- image_publisher/offer/sku/version (defaults target AVD marketplace image)
- install_avd_agent, agent_install_script_urls, agent_install_command

Outputs:
- vm_id, vm_name, nic_id, private_ip_address

Example usage:

module "avd_session_host" {
  source              = "../modules/windows-vm-avd"
  name                = "avd-vm-01"
  resource_group_name = "rg-avd"
  location            = "eastus"
  subnet_id           = "<subnet-id>"
  nic_name            = "avd-vm-01-nic"
  admin_username      = "azureuser"
  admin_password      = "P@ssw0rd!"
  install_avd_agent   = true
  agent_install_script_urls = ["https://example.com/install-avd-agent.ps1"]
  agent_install_command = "powershell -ExecutionPolicy Unrestricted -File install-avd-agent.ps1"
}
