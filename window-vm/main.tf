resource "azurerm_public_ip" "pip" {
  for_each = var.vm
  name                = each.value.ipname
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"

}

resource "azurerm_network_interface" "nic" {
  for_each = var.vm
  name                = each.value.nicname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.sn[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip[each.key].id
  }
}

resource "azurerm_windows_virtual_machine" "example" {
  for_each = var.vm
  name                = each.value.vmname
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

 admin_password = "Adminuser@1234"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}