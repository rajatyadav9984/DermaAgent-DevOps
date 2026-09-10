output "vnet_id" {
  description = "ID of the Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "Name of the Virtual Network"
  value       = azurerm_virtual_network.vnet.name
}

output "frontend_subnet_id" {
  description = "ID of the Frontend Subnet"
  value       = azurerm_subnet.frontend.id
}

output "backend_subnet_id" {
  description = "ID of the Backend Subnet"
  value       = azurerm_subnet.backend.id
}

output "database_subnet_id" {
  description = "ID of the Database Subnet"
  value       = azurerm_subnet.database.id
}

output "nsg_id" {
  description = "ID of the Network Security Group"
  value       = azurerm_network_security_group.nsg.id
}
