terraform {
  backend "azurerm" {
    resource_group_name   = "Roadtyre"        # The resource group where your storage account is located
    storage_account_name  = "rtcorestorageac"       # The name of your storage account
    container_name        = "tfstate"             # The container in which to store the state file
    key                   = "terraform.tfstate"    # The name of the state file within the container
  }
}