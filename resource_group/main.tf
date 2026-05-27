#Resource block to create Resource Group
resource "azurerm_resource_group" "RG1" {
  for_each = var.rg-names
  name     = each.key
  location = each.value
}