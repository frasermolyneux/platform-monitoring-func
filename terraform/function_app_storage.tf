resource "azurerm_storage_account" "function_app_storage" {
  for_each = toset(var.locations)

  name                = "safn${random_id.environment_location_id[each.value].hex}"
  resource_group_name = azurerm_resource_group.rg[each.value].name
  location            = azurerm_resource_group.rg[each.value].location

  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  access_tier              = "Hot"

  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"

  tags = var.tags
}
