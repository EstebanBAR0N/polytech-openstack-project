provider "openstack" {
  cloud = "openstack"
  insecure = true
}

resource "openstack_networking_port_v2" "port_1" {
  network_id = var.main_network_id
}

# instance
resource "openstack_compute_instance_v2" "instance_from_terraform" {
  name            = "instance_from_terraform"
  image_id        = var.image_id
  flavor_id       = var.flavor_id
  key_pair        = var.key_pair
  security_groups = var.security_groups

  network {
    name = "main"
    port = openstack_networking_port_v2.port_1.id
  }

  depends_on = [ openstack_networking_port_v2.port_1 ]
}

# floating ip
resource "openstack_networking_floatingip_v2" "floatip_for_instance_from_terraform" {
  pool = "public"
}

# associate floating ip to instance
resource "openstack_networking_floatingip_associate_v2" "fip_1" {
  floating_ip = openstack_networking_floatingip_v2.floatip_for_instance_from_terraform.address
  port_id     = openstack_networking_port_v2.port_1.id

  depends_on = [ openstack_compute_instance_v2.instance_from_terraform, openstack_networking_floatingip_v2.floatip_for_instance_from_terraform ]
}