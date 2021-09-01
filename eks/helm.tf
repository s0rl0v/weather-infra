resource "helm_release" "ascp" {
  name       = "csi-secrets-store"
  repository = "https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts"
  chart      = "secrets-store-csi-driver"
  version    = "0.3.0"
  namespace  = "kube-system"
}
