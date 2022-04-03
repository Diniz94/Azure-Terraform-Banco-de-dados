provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-sqldatabase"
  location = "brazilsouth"
}

resource "azurerm_sql_server" "sqlserver" {
  name                = "sqlservertf-azure"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  version                      = "12.0"
  administrator_login          = "administrador"
  administrator_login_password = "Claudio@2022"
}


resource "azurerm_mssql_database" "mssqdatabase" {
  name      = "db_terraform"
  server_id = azurerm_sql_server.sqlserver.id
  collation = "SQL_latin1_General_CP1_CI_AS"
  sku_name  = "Basic"
}
