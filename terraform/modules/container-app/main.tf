data "azurerm_container_app_environment" "existing" {
  name                = var.container_app_environment_name
  resource_group_name = var.resource_group_name
}

data "azurerm_container_registry" "existing" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_container_app" "dermaagent" {
  name                         = var.container_app_name
  resource_group_name          = var.resource_group_name
  container_app_environment_id = data.azurerm_container_app_environment.existing.id
  revision_mode                = "Single"

  secret {
    name  = "acr-password"
    value = data.azurerm_container_registry.existing.admin_password
  }

  registry {
    server               = data.azurerm_container_registry.existing.login_server
    username             = data.azurerm_container_registry.existing.admin_username
    password_secret_name = "acr-password"
  }

  ingress {
    external_enabled = true
    target_port      = 5000
    transport        = "auto"

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  template {
    min_replicas = 1
    max_replicas = 1

    container {
      name   = "dermaagent"
      image  = var.container_image
      cpu    = 1.0
      memory = "2Gi"
    }
  }
}
