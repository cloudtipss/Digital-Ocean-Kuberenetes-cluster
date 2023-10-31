output "cluster_id" {
  value = digitalocean_kubernetes_cluster.cluster.id
}

output "cluster_name" {
  value = digitalocean_kubernetes_cluster.cluster.name
}

output "update_config" {
  value = "doctl kubernetes cluster kubeconfig save ${digitalocean_kubernetes_cluster.cluster.name}"
}
