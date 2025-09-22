terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.45.1"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}