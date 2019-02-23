variable "namespaces" {
  description = "List of namespaces"
}

variable "owner" {
  description = "Namespaces owner"
}

variable "registry_url" {
  description = "Docker registry url"
}

variable "registry_user" {
  description = "Docker registry user"
}

variable "registry_pass" {
  description = "Docker registry password"
}

variable "labels" {
  description = "Namespace labels"
  default     = {}
}

variable "annotations" {
  description = "Namespace annotations"
  default     = {}
}
