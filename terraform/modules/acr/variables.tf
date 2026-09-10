variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
  default     = "acrdermaagentdev"
}

variable "sku" {
  description = "SKU for the Azure Container Registry"
  type        = string
  default     = "Basic"
}

variable "admin_enabled" {
  description = "Enable admin user for ACR"
  type        = bool
  default     = true
}
