# Fetch the existing DNS zone in another resource group
data "azurerm_dns_zone" "utilstop" {
  name                = "utilstop.com"
  resource_group_name = "utilstop"  # Replace with the actual resource group name of the DNS zone
}

# Create an A Record in the DNS Zone
resource "azurerm_dns_a_record" "tfvm_record" {
  name                = "stage"  # This will create stage.utilstop.com
  zone_name           = data.azurerm_dns_zone.utilstop.name
  resource_group_name = data.azurerm_dns_zone.utilstop.resource_group_name
  ttl                 = 60  # Time to live in seconds

  # Reference the public IP from main.tf
  records = [azurerm_public_ip.testuspi.ip_address]
}