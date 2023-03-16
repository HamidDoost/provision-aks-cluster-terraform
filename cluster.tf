# AKS Cluster

resource "azurerm_kubernetes_cluster" "cluster" {
  name                              = var.cluster_name
  location                          = var.resource_group_location
  resource_group_name               = var.resource_group_name
  dns_prefix                        = var.dns_prefix
  http_application_routing_enabled  = true
  kubernetes_version                = var.kubernetes_version
  role_based_access_control_enabled = true

  default_node_pool {
    name                   = "master"
    node_count             = var.node_count # if set, should be between min_count and max_count
    vm_size                = "Standard_D2ads_v5"
    enable_auto_scaling    = true
    min_count              = 2
    max_count              = 4
    # enable_host_encryption = true
    # zones                  = range(1, 4)
  }

  network_profile {
    network_plugin    = "kubenet"
    network_policy    = "calico"
    load_balancer_sku = "standard"
  }

  service_principal {
    client_id     = var.aks_service_principal_app_id
    client_secret = var.aks_service_principal_client_secret
  }

  tags = {
    environment = "Example"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "worker" {
  name                  = "worker"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.cluster.id
  node_count              = var.node_count # if set, should be between min_count and max_count
  vm_size                 = "Standard_D4ads_v5"
  enable_auto_scaling     = true
  min_count               = 2
  max_count               = 4
  # enable_host_encryption = true
  os_type                 = "Linux"
  # zones                   = range(1, 4)
}