resource "azurerm_resource_group" "rgAci" {
  name     = "rg-aci-euw"
  location = "West Europe"
  tags = {
    persistent = "no"
  }

}

resource "azurerm_container_group" "aci" {
  resource_group_name = azurerm_resource_group.rgAci.name
  location            = azurerm_resource_group.rgAci.location
  name                = "aci-demowebsite-Public"
  os_type             = "Linux"

  
  
  container {
    name   = "demo-web-site"
    image  = "${data.azurerm_container_registry.acr.login_server}/demowebsite:latest"
    cpu    = "1"
    memory = "0.5"
    



    ports {
      port     = 80
      protocol = "TCP"
    }

  }
  image_registry_credential {
    server   = data.azurerm_container_registry.acr.login_server
    username = data.azurerm_container_registry.acr.admin_username
    password = data.azurerm_container_registry.acr.admin_password
  }
  lifecycle {
    ignore_changes =[
      tags,
    ]
  }
}

