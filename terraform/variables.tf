# Variables
variable "resource_group_name1" {
  default = "BastionResourceGroup"
}

variable location_region {
  default = "eastus"
}

variable dev_vnet_cidr {
  default = "10.1.0.0/16"
}

variable dev_subnet1_cidr {
  default = "10.1.1.0/24"
}

variable count_vm {
  default = 1
}

variable my_public_key{}
variable ip_admin {}


# VARs - AKS
variable "client_id" {
}
variable "client_secret" {
}

variable "agent_count" {
    default = 3
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
    default = "aks"
}

variable cluster_name {
    default = "aks"
}

variable resource_group_aks {
    default = "azure-aks"
}

variable location {
    default = "Central US"
}