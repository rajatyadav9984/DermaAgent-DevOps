output "container_app_name" {
  description = "Container App name"
  value       = azurerm_container_app.dermaagent.name
}

output "container_app_url" {
  description = "Public Container App URL"
  value       = "https://${azurerm_container_app.dermaagent.ingress[0].fqdn}"
}

output "container_app_fqdn" {
  description = "Container App FQDN"
  value       = azurerm_container_app.dermaagent.ingress[0].fqdn
}
