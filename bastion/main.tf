resource "azurerm_public_ip" "example" {
  name                = "baship"
  location            = "Canada Central"
  resource_group_name = "RG1tf"
  allocation_method   = "Static"
  sku                 = "Standard"
}
resource "azurerm_bastion_host" "example" {
  name                = "BastionLinux"
  location            = "Canada Central"
  resource_group_name = "RG1tf"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = "/subscriptions/d4ba563c-83ef-4ee3-b256-0a280d624031/resourceGroups/RG1tf/providers/Microsoft.Network/virtualNetworks/Linux-Vnet/subnets/AzureBastionSubnet"
    public_ip_address_id = azurerm_public_ip.example.id
  }
}