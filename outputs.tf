# Outputs

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.cluster.name
  sensitive = true
}

output "host" {
  value = azurerm_kubernetes_cluster.cluster.kube_config.0.host
  sensitive = true
}

output "client_key" {
  value = azurerm_kubernetes_cluster.cluster.kube_config.0.client_key
  sensitive = true
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.cluster.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.cluster.kube_config_raw
  sensitive = true
}

output "cluster_username" {
  value = azurerm_kubernetes_cluster.cluster.kube_config.0.username
  sensitive = true
}

output "cluster_password" {
  value = azurerm_kubernetes_cluster.cluster.kube_config.0.password
  sensitive = true
}