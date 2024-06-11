terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.40.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.11.0"
    }
  }
}
