resource "kubernetes_manifest" "namespace_thanos" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "v1"
    "kind" = "Namespace"
    "metadata" = {
      "name" = "thanos"
    }
  }
}
