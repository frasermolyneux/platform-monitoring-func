resource "azurerm_resource_group" "rg" {
  for_each = toset(var.locations)

  name     = "rg-platform-monitoring-func-${var.environment}-${each.value}-${var.instance}"
  location = each.value

  tags = var.tags
}
