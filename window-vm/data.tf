data "azurerm_subnet" "sn" {
    for_each = var.vm
  name                 = each.value.snetname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.resource_group_name
}