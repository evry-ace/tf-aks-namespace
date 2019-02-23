locals {
  annotations = {
    Created-On   = "${timestamp()}"
    Created-With = "Terraform"
    Created-By   = "${var.owner}"
  }
}

resource "kubernetes_namespace" "namespace" {
  count = "${length(var.namespaces)}"

  metadata {
    name        = "${element(var.namespaces, count.index)}"
    labels      = "${var.labels}"
    annotations = "${merge(local.annotations, var.annotations)}"
  }
}

resource "kubernetes_secret" "secret" {
  count = "${length(var.namespaces)}"

  metadata {
    name        = "${var.registry_url}"
    namespace   = "${element(var.namespaces, count.index)}"
    labels      = "${var.labels}"
    annotations = "${merge(local.annotations, var.annotations)}"
  }

  data {
    ".dockerconfigjson" = "{\"auths\": {\"https:\/\/index.docker.io\/v1\/\": {\"username\": \"${var.registry_user}\", \"password\": \"${var.registry_pass}\",\"auth\": \"${base64encode("${var.registry_url}:${var.registry_pass}")}\"}}}"
  }

  type = "kubernetes.io/dockerconfigjson"
}
