terraform {
  required_providers {
    kubernetes-alpha = {
      source  = "hashicorp/kubernetes-alpha"
      version = ">= 0.3.0"
    }
  }

}
module "prometheus-operator" {
  source  = "aareet/prometheus-operator/kubernetes"
  version = ">=0.0.2"
}
