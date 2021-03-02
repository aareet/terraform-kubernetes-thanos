resource "kubernetes_manifest" "servicemonitor_thanos_store" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "monitoring.coreos.com/v1"
    "kind" = "ServiceMonitor"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/component" = "object-store-gateway"
        "app.kubernetes.io/instance" = "thanos-store"
        "app.kubernetes.io/name" = "thanos-store"
        "app.kubernetes.io/version" = "v0.17.2"
      }
      "name" = "thanos-store"
      "namespace" = "thanos"
    }
    "spec" = {
      "endpoints" = [
        {
          "port" = "http"
          "relabelings" = [
            {
              "separator" = "/"
              "sourceLabels" = [
                "namespace",
                "pod",
              ]
              "targetLabel" = "instance"
            },
          ]
        },
      ]
      "selector" = {
        "matchLabels" = {
          "app.kubernetes.io/component" = "object-store-gateway"
          "app.kubernetes.io/instance" = "thanos-store"
          "app.kubernetes.io/name" = "thanos-store"
        }
      }
    }
  }
  depends_on = [module.prometheus-operator]
}
