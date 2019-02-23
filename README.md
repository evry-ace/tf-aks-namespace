# tf\_aks\_namespace

Create Kubernetes namespaces with corresponding pull secret. This module will
create the namespaces with propper labels and annotations and create Docker pull
ssecrets for downloading container images from a container registry.

## Usage

```hcl
module "namespaces" {
  source = "github.com/evry-ace/tf_aks_cluster_admin"

  namespaces = ["a-test, "a-prod"]
  ownwer     = "The A-Team"

  registry_url  = "${modules.acr.registry_url}"
  registry_user = "${modules.acr.registry_user}"
  registry_pass = "${modules.acr.registry_pass}"

  labels {
    My-Label = "My Value"
  }

  annotations {
    My-Annotation = "My Value"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| namespaces | List of namespaces | list | `[]` | yes |
| owner | Owner name | string | `""` | yes |
| registry\_url | Container registry url | string | `""` | yes |
| registry\_user | Container registry user | string | `""` | yes |
| registry\_pass | Container registry password | string | `""` | yes |
| labels | Namespace labels | map | `{}` | no |
| annotations | Namespace annotations | map | `{} | no |

## Authors

Module is maintained by the EVRY ACE Team.

## License

MIT License. See [LICENSE](./LICENSE) for full details.
