variable "prefix" {
  default = "one-media"
  description = "A prefix used for all resources in this example"
}

variable "location" {
  default     = "West Europe"
  description = "The Azure Region in which all resources in this example should be provisioned"
}

variable "client_id" {
  default = "c496cc6b-290d-4d72-bf71-fbd05e3cb10d"
  description = "The Client ID for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "client_secret" {
  default = "cbd578f8-9625-4f17-9313-19fb5f6e7113"
  description = "The Client Secret for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "vnet_id" {
  default = "/subscriptions/9b1b3746-eb27-417d-804c-a00646520a34/resourceGroups/msmelon-caf-rg/providers/Microsoft.Network/virtualNetworks/caf-vnet/subnets/aks-subnet"
  description = "Use CNI for this Managed Kubernetes Cluster must pass Vnet ID which refers to the VNet to deploy this cluster"
}
