resource "azurerm_resource_group" "rgAci" {
  name     = var.rg-name
  location = var.location
  tags = {
    persistent = "no"
  }

}
resource "azurerm_container_group" "aci" {
  resource_group_name = azurerm_resource_group.rgAci.name
  location            = azurerm_resource_group.rgAci.location
  name                = var.aci-name
  os_type             = "Linux"  
  container {
    name   = var.container-name
    image  = var.image
    cpu    = "1"
    memory = "0.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  lifecycle {
    ignore_changes =[
      tags,
    ]
  }
}

