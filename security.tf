resource "openstack_networking_secgroup_v2" "zerotrust" {
  name        = "zerotrust"
  description = "Zerotrust firewall rules"
}

resource "openstack_networking_secgroup_rule_v2" "zerotrust-ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "${module.ip.public-ip}"
  security_group_id = openstack_networking_secgroup_v2.zerotrust.id
}

resource "openstack_networking_secgroup_rule_v2" "zerotrust-http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.zerotrust.id
}
resource "openstack_networking_secgroup_rule_v2" "zerotrust-https" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.zerotrust.id
}
resource "openstack_networking_secgroup_rule_v2" "zerotrust-bastion" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 9800
  port_range_max    = 9800
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.zerotrust.id
}

resource "openstack_networking_secgroup_v2" "interconnect" {
  name        = "interconnect"
  description = "Interconnect security group"
}