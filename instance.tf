resource "openstack_compute_instance_v2" "zerotrust" {
  name            = "zerotrust"
  image_id        = "2f6b4718-dbe4-470c-a7c6-03f031e30b21"
  flavor_name       = "s1-2"
  key_pair        = openstack_compute_keypair_v2.user.name
  security_groups = [openstack_networking_secgroup_v2.zerotrust.id, openstack_networking_secgroup_v2.interconnect.id]


  network {
    uuid = "6011fbc9-4cbf-46a4-8452-6890a340b60b"
  }
}

output "ip" {
  value = openstack_compute_instance_v2.zerotrust.access_ip_v4
}