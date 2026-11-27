terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.15.0"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}