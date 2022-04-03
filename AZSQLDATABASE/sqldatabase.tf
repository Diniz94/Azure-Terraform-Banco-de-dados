provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name = "rg-sqldatabase"
  location = "brazilsouth"
}

resource "azurerm_sql_server" "sqlserver" {
  name = "sqlservertf"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location

  version = "12.0"
  administrator_login = "administrador"
  administrator_login_password = "Claudio@2022"
}

