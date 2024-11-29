# kubernetes_pod and kubernetes_service definitions remain the same
resource "kubernetes_pod" "my_app_pod" {
  metadata {
    name      = "my-app"
    namespace = "default"  # Ensure you are using the default namespace
    labels = {
      app = "my-app"
    }
  }

  spec {
    container {
      name  = "my-app-container"
      image = "saadrehman17100/textile-plm-digitalisation:latest"
      port {
        container_port = 3000
      }
      
      volume_mount {
        mount_path = "/app"
        name       = "app-volume"
      }
    }

    volume {
      name = "app-volume"
      host_path {
        path = "/mnt/data"
        type = "Directory"
      }
    }
  }
}

resource "kubernetes_service" "my_app_service" {
  metadata {
    name      = "my-app-service"
    namespace = "default"
  }

  spec {
    selector = {
      app = "my-app"
    }

    port {
      port        = 80
      target_port = 3000
    }

    type = "NodePort"
  }
}

output "kubernetes_service_url" {
  value = "http://${kubernetes_service.my_app_service.spec[0].cluster_ip}:${kubernetes_service.my_app_service.spec[0].port[0].node_port}"
}