resource "random_id" "cluster_name" {
  byte_length = 5
}

locals {
  doks_cluster_name = "${var.env}-${var.cluster_name_prefix}-${random_id.cluster_name.hex}"
}

resource "digitalocean_kubernetes_cluster" "cluster" {
  name    = local.doks_cluster_name
  region  = var.region
  version = var.cluster_version
  ha      = true

  node_pool {
    name       = var.default_node_pool["name"]
    size       = var.default_node_pool["size"]
    node_count = var.default_node_pool["node_count"]
    auto_scale = var.default_node_pool["auto_scale"]
    min_nodes  = var.default_node_pool["min_nodes"]
    max_nodes  = var.default_node_pool["max_nodes"]
  }
}

resource "digitalocean_kubernetes_node_pool" "cluster_extra_node_pool" {
  cluster_id = digitalocean_kubernetes_cluster.cluster.id
  for_each   = var.additional_node_pools

  name       = each.value.name
  size       = each.value.size
  node_count = each.value.node_count
  auto_scale = each.value.auto_scale
  min_nodes  = each.value.min_nodes
  max_nodes  = each.value.max_nodes
}
