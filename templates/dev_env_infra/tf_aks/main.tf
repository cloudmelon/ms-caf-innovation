provider "azurerm" {
  version = "=1.38.0"
}


resource "azurerm_resource_group" "rg" {
  name     = "one-media-tf-rg"
  location = "${var.location}"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.prefix}-k8s"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  dns_prefix          = "${var.prefix}-k8s"

  agent_pool_profile {
    name            = "default"
    count           = 1
    vm_size         = "Standard_D3_v2"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  network_profile {
    network_plugin = "azure"
    vnet_subnet_id = "${var.vnet_id}"
  }

  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

  tags {
    Environment = "Dev"
  }
}