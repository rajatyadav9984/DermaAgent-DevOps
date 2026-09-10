variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "container_app_environment_name" {
  description = "Existing Container Apps Environment name"
  type        = string
}

variable "container_app_name" {
  description = "Name of the Container App"
  type        = string
}

variable "acr_name" {
  description = "Azure Container Registry name"
  type        = string
}

variable "container_image" {
  description = "Docker image to deploy"
  type        = string
}
