resource "kubernetes_manifest" "service_thanos_query" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/component" = "query-layer"
        "app.kubernetes.io/instance" = "thanos-query"
        "app.kubernetes.io/name" = "thanos-query"
        "app.kubernetes.io/version" = "v0.17.2"
      }
      "name" = "thanos-query"
      "namespace" = kubernetes_manifest.namespace_thanos.object.metadata.name
    }
    "spec" = {
      "ports" = [
        {
          "name" = "grpc"
          "port" = 10901
          "targetPort" = 10901
	  "protocol" = "TCP"
        },
        {
          "name" = "http"
          "port" = 9090
          "targetPort" = 9090
	  "protocol" = "TCP"
        },
      ]
      "selector" = {
        "app.kubernetes.io/component" = "query-layer"
        "app.kubernetes.io/instance" = "thanos-query"
        "app.kubernetes.io/name" = "thanos-query"
      }
    }
  }
}
