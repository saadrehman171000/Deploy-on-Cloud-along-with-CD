terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  config_context_cluster = "minikube"
  host = "https://kubernetes.default.svc"
  insecure = true
}

resource "kubernetes_namespace" "app_namespace" {
  metadata {
    name = "next-app"
  }
} 