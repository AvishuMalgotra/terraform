resource "azurerm_virtual_network_peering" "example-1" {
  name                      = "peer1to2"
  resource_group_name       = "RG1tf"
  virtual_network_name      = "Linux-Vnet"
  remote_virtual_network_id = "/subscriptions/d4ba563c-83ef-4ee3-b256-0a280d624031/resourceGroups/RG2tf/providers/Microsoft.Network/virtualNetworks/Windows-Vnet"
}

resource "azurerm_virtual_network_peering" "example-2" {
  name                      = "peer2to1"
  resource_group_name       = "RG2tf"
  virtual_network_name      = "Windows-Vnet"
  remote_virtual_network_id = "/subscriptions/d4ba563c-83ef-4ee3-b256-0a280d624031/resourceGroups/RG1tf/providers/Microsoft.Network/virtualNetworks/Linux-Vnet"
}