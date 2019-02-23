# tf\_aks\_namespace

TBA

## Usage

```hcl
module "namespaces" {
  namespaces = ["a-test, "a-prod"]
  ownwer = "The A-Team"

  registry_url = "${modules.acr.registry_url}"
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
