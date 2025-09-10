resource "digitalocean_kubernetes_cluster" "k8s" {
  name    = var.cluster_name
  region  = var.region
  version = "1.28.6-do.2" # change if needed

  node_pool {
    name       = "default-pool"
    size       = "s-2vcpu-4gb"
    node_count = var.node_count
  }
}

output "kubeconfig" {
  value     = digitalocean_kubernetes_cluster.k8s.kube_configs[0].raw_kube_config
  sensitive = true
}
