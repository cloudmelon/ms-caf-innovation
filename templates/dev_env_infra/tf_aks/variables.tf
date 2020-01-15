variable "prefix" {
  default = "one-media"
  description = "A prefix used for all resources in this example"
}

variable "location" {
  default     = "West Europe"
  description = "The Azure Region in which all resources in this example should be provisioned"
}

variable "client_id" {
  default = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  description = "The Client ID for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "client_secret" {
  default = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  description = "The Client Secret for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "vnet_id" {
  default = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  description = "Use CNI for this Managed Kubernetes Cluster must pass Vnet ID which refers to the VNet to deploy this cluster"
}
