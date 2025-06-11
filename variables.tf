variable "resource_group_name" {
    default = "bestrong-resources"
}

variable "location" {
  default = "westeurope"
}

variable "storage_account_name" {
  default = "bestrongstorageaccount"
}

variable "ai_account_name"{
    default = "bestrongformai"
}

variable "app_service_plan_name" {
  default = "bestrongplan"
}

variable "function_app_name" {
  default = "bestrongfuncapp"
}

variable "ai_sku" {
  default = "F0"
}
# variable "client_id" {}

# variable "client_secret" {}

# variable "subscription_id" {}

# variable "tenant_id" {}