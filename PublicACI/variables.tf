variable "rg-name" {
  type = string
  default = "rg-demo-aci"
}

variable "location" {
  type = string 
  default = "West Europe"
}
variable "aci-name" {
  type = string
  default = "aci-demowebsite-Public"
}
variable "image" {
  type = string 
  default = "acrdemoeuw9986.azurecr.io/demowebsite:latest"
}
variable "container-name" {
  type =  string 
  default = "demo-web-site"
}