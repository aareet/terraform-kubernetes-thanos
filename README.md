This module installs Thanos into your cluster. Please note that this assumes you already have a working installation of the Prometheus Operator (https://registry.terraform.io/modules/aareet/prometheus-operator/kubernetes/latest).


An example configuration could be:

```
terraform {
  required_providers {
    kubernetes-alpha = {
      source = "hashicorp/kubernetes-alpha"
    }
  }
}
provider "kubernetes-alpha" {
  config_path = "~/.kube/config" // path to kubeconfig
}
module "prometheus-operator" {
  source  = "aareet/prometheus-operator/kubernetes"
  version = ">=0.0.2"
}
module "thanos" {
  source    = "./thanos-module"
  depends_on = [module.prometheus-operator]
}
```

This configuration would require two apply operations to complete:

`terraform apply -target=module.prometheus-operator`
followed by
`terraform apply`
