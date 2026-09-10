output "resource_group_name" {
  description = "Resource Group Name"
  value       = module.resource_group.name
}

output "resource_group_location" {
  description = "Resource Group Location"
  value       = module.resource_group.location
}

output "vnet_name" {
  description = "Virtual Network Name"
  value       = module.networking.vnet_name
}

output "acr_login_server" {
  description = "Azure Container Registry Login Server"
  value       = module.acr.login_server
}

output "container_app_name" {
  value = module.container_app.container_app_name
}

output "container_app_url" {
  value = module.container_app.container_app_url
}

output "container_app_fqdn" {
  value = module.container_app.container_app_fqdn
}

