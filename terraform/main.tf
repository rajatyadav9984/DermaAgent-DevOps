# =========================================
# 1. Resource Group Module
# =========================================
module "resource_group" {
  source              = "./modules/resource-group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

# =========================================
# 2. Networking Module
# =========================================
module "networking" {
  source              = "./modules/networking"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  vnet_name           = "vnet-dermaagent-dev"
  nsg_name            = "nsg-dermaagent-dev"
}

# =========================================
# 3. ACR Module
# =========================================
module "acr" {
  source              = "./modules/acr"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  acr_name            = "acrdermaagentdev"
  sku                 = "Basic"
  admin_enabled       = true
}

# =========================================
# 4. Container App Module
# =========================================
module "container_app" {
  source = "./modules/container-app"

  resource_group_name            = module.resource_group.name
  location                       = module.resource_group.location
  container_app_environment_name = "cae-dermaagent-dev"
  container_app_name             = "ca-dermaagent-dev"
  acr_name                       = "acrdermaagentdev"
  container_image                = "acrdermaagentdev.azurecr.io/dermaagent:latest"
}

