#Initialize the provider azurerm and azuread

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.12"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0.2"
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }

  }

  required_version = "~> 1.15.0"
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
}
provider "azuread" {

}

provider "local" {
}