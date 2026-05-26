#Resource block to create Resource Group
resource "azurerm_resource_group" "RG" {
  name     = var.rg-name
  location = "westus"
}