
data "azurerm_application_insights" "portal" {
  name                = var.portal_app_insights.name
  resource_group_name = var.portal_app_insights.resource_group_name
}
