# Declare varaiables in this file.

# This variable is only a place holder for Service Princiapl appId.
# Set the values for this variable in terraform.tfvars
variable "aks_service_principal_app_id" {
  description = "Azure Kubernetes Service Cluster service principal appId"
}

# This variable is only a place holder for Service Princiapl password.
# Set the values for this variable in terraform.tfvars
variable "aks_service_principal_client_secret" {
  description = "Azure Kubernetes Service Cluster service principal password"
}

# Declare number of nodes per node pool.
# This should be bewteen min_count and max_count if you enable autoscaling for cluster
variable "node_count" {
  default = 3
}

variable "cluster_name" {
  default = "example-cluster"
}

variable "dns_prefix" {
  default = "example-cluster-dns"
}

variable "resource_group_location" {
  default     = "australiaeast"
  description = "Location of the resource group."
}

# Replace myResourceGroup with the name of resource group that you created earlier.
variable "resource_group_name" {
  default     = "myResourceGroup"
  description = "Name of the resource group."
}

# The latest supported version in AKS is 1.25.5 at the time of writing this file.
# If you do not set this variable, the latest stable version will be used.
variable "kubernetes_version" {
  default     = "1.25.5"
  description = " The version of Kubernetes for cluster."
}