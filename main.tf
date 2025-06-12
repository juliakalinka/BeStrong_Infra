provider "azurerm" {
  features {}
#   client_id       = var.client_id
#   client_secret   = var.client_secret
#   tenant_id       = var.tenant_id
#   subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "main" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "fileshare" {
  name                 = "myshare"
  storage_account_id = azurerm_storage_account.main.id
  quota                = 100
}

resource "azurerm_storage_container" "blobcontainer" {
  name                  = "mycontainer"
  storage_account_id = azurerm_storage_account.main.id
  container_access_type = "private"
}

resource "azurerm_cognitive_account" "form_recognizer" {
  name                = var.ai_account_name
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  kind                = "FormRecognizer"
  sku_name            = var.ai_sku
}

resource "azurerm_service_plan" "main" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "bestrong_app" {
  name                = var.function_app_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  service_plan_id     = azurerm_service_plan.main.id
  
  storage_account_name       = azurerm_storage_account.main.name
  storage_account_access_key = azurerm_storage_account.main.primary_access_key

  functions_extension_version = "~4"
  
  site_config {
    application_stack {
      python_version = "3.9"
    }
  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"      = "python"
    "FileShareConnectionString"     = ""
    "FormRecognizerEndpoint"        = ""
    "FormRecognizerKey"             = ""
    "BlobStorageConnectionString"   = ""
    "DiscordWebhookUrl"             = ""
    "SlackWebhookUrl"               = ""
  }
}