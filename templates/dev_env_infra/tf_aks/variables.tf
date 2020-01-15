variable "prefix" {
  default = "one-media"
  description = "A prefix used for all resources in this example"
}

variable "location" {
  default     = "West Europe"
  description = "The Azure Region in which all resources in this example should be provisioned"
}

variable "kubernetes_client_id" {
  default = "5cb651c1-0098-4b3b-b21f-51587ef64b8a"
  description = "The Client ID for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "kubernetes_client_secret" {
  default = "f9cffd83-36b2-4f40-b142-3190d35708f7"
  description = "The Client Secret for the Service Principal to use for this Managed Kubernetes Cluster"
}