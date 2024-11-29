terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  host = var.host
  token = var.token
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)

  # For development/testing only
  insecure = true
}

variable "host" {
  type = string
  description = "Kubernetes API endpoint"
}

variable "token" {
  type = string
  sensitive = true
  description = "Kubernetes service account token"
}

variable "cluster_ca_certificate" {
  type = string
  description = "Kubernetes cluster CA certificate"
}

resource "kubernetes_namespace" "app_namespace" {
  metadata {
    name = "next-app"
  }
}