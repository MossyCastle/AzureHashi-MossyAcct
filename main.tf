# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "<2.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  
  subscription_id = var.subscriptionID
  client_id = var.clientID
  client_secret = var.clientSecret
  tennant_id =var.tennantID
  
  }

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "mossy-example-resources"
  location = "us-east"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}
