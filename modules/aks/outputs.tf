#AKS Cluster outputs here

output "cluster_id" {
  description = "The ID of the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.id
}

output "kube_config_raw" {
  description = "The kube_config of the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive   = true
}

output "kublet_identity_object_id" {
  description = "The kublet identity of the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity[0].object_id
}