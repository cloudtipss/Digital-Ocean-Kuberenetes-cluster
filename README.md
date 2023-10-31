# DO-Kuberenetes-cluster
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | >= 2.25.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | 2.31.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_kubernetes_cluster.cluster](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_cluster) | resource |
| [digitalocean_kubernetes_node_pool.cluster_extra_node_pool](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_node_pool) | resource |
| [random_id.cluster_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_node_pools"></a> [additional\_node\_pools](#input\_additional\_node\_pools) | DOKS cluster extra node pool configurations | <pre>map(object({<br>    name       = string<br>    node_count = number<br>    size       = string<br>    auto_scale = bool<br>    min_nodes  = number<br>    max_nodes  = number<br>    <br>  }))</pre> | <pre>{<br>  "additional-pool-1": {<br>    "auto_scale": true,<br>    "max_nodes": 5,<br>    "min_nodes": 1,<br>    "name": "additional-pool-1",<br>    "node_count": 1,<br>    "size": "s-2vcpu-4gb"<br>  }<br>}</pre> | no |
| <a name="input_cluster_name_prefix"></a> [cluster\_name\_prefix](#input\_cluster\_name\_prefix) | DOKS cluster name prefix value (a random suffix is appended automatically) | `string` | `"k8s"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | DOKS Kubernetes version | `string` | `"1.28.2-do.0"` | no |
| <a name="input_default_node_pool"></a> [default\_node\_pool](#input\_default\_node\_pool) | DOKS cluster default node pool configuration | `map(any)` | <pre>{<br>  "auto_scale": true,<br>  "max_nodes": 5,<br>  "min_nodes": 1,<br>  "name": "default-pool",<br>  "node_count": 1,<br>  "size": "s-2vcpu-4gb"<br>}</pre> | no |
| <a name="input_env"></a> [env](#input\_env) | DOKS Kubernetes environment | `string` | `"test"` | no |
| <a name="input_pat_do_token"></a> [pat\_do\_token](#input\_pat\_do\_token) | Personal Access Token to access the DigtialOcean API | `string` | `"<YOUR-DO-TOKEN>"` | no |
| <a name="input_region"></a> [region](#input\_region) | DO region name | `string` | `"syd1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | n/a |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
| <a name="output_update_config"></a> [update\_config](#output\_update\_config) | n/a |
<!-- END_TF_DOCS -->