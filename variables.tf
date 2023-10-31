variable "pat_do_token" {
  description = "Personal Access Token to access the DigtialOcean API"
  default = "<YOUR-DO-TOKEN>"
}

variable "cluster_name_prefix" {
  type        = string
  default     = "k8s"
  description = "DOKS cluster name prefix value (a random suffix is appended automatically)"
}

variable "env" {
  type        = string
  default     = "test"
  description = "DOKS Kubernetes environment"
}

variable "cluster_version" {
  type        = string
  default     = "1.28.2-do.0"
  description = "DOKS Kubernetes version"
}


variable "region" {
  type        = string
  default     = "syd1"
  description = "DO region name"
}

variable "default_node_pool" {
  type = map(any)
  default = {
    name       = "default-pool"
    node_count = 1
    size       = "s-2vcpu-4gb"
    auto_scale = true
    min_nodes = 1
    max_nodes = 5
  }
  description = "DOKS cluster default node pool configuration"
}

variable "additional_node_pools" {
  type = map(object({
    name       = string
    node_count = number
    size       = string
    auto_scale = bool
    min_nodes  = number
    max_nodes  = number
    
  }))

  default = {
    additional-pool-1 = {
      name       = "additional-pool-1"
      node_count = 1
      size       = "s-2vcpu-4gb"
      auto_scale = true
      min_nodes  = 1
      max_nodes  = 5
    }
    # additional-pool-2 = {
    #   name       = "additional-pool-2"
    #   node_count = 2
    #   size       = "s-4vcpu-8gb"
    #   auto_scale = true
    #   min_nodes  = 2
    #   max_nodes  = 10
    # }
    # Add more node pool configurations as needed
  }

  description = "DOKS cluster extra node pool configurations"
}


