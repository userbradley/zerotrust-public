resource "openstack_compute_keypair_v2" "user" {
  name       = "computer"
  public_key = file("/Users/${var.me}/.ssh/id_rsa.pub")
}