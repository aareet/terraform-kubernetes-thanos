resource "kubernetes_manifest" "service_thanos_store" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/component" = "object-store-gateway"
        "app.kubernetes.io/instance" = "thanos-store"
        "app.kubernetes.io/name" = "thanos-store"
        "app.kubernetes.io/version" = "v0.17.2"
      }
      "name" = "thanos-store"
      "namespace" = kubernetes_manifest.namespace_thanos.object.metadata.name
    }
    "spec" = {
      "clusterIP" = "None"
      "ports" = [
        {
          "name" = "grpc"
          "port" = 10901
          "targetPort" = 10901
	  "protocol" = "TCP"
        },
        {
          "name" = "http"
          "port" = 10902
          "targetPort" = 10902
	  "protocol" = "TCP"
        },
      ]
      "selector" = {
        "app.kubernetes.io/component" = "object-store-gateway"
        "app.kubernetes.io/instance" = "thanos-store"
        "app.kubernetes.io/name" = "thanos-store"
      }
    }
  }
}
