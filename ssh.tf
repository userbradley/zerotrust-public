resource "openstack_compute_keypair_v2" "user" {
  name       = "gft-mac"
  public_key = file("/Users/${var.me}/.ssh/id_rsa.pub")
}