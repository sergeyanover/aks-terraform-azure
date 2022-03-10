# Resources
resource "azurerm_resource_group" "dev_rg" {
  name     = var.resource_group_name1
  location = var.location_region
  tags = {
    environment = "dev"
  }
}

resource "azurerm_resource_group" "k8s" {
    name     = var.resource_group_aks
    location = var.location
}
