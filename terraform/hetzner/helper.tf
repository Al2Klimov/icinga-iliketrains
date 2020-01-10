resource "hcloud_server" "aklimov-iliketrains1-helper" {
	name = "aklimov-iliketrains1-helper"

	server_type = "cx51"

	ssh_keys = [ "AK" ]
	image = "debian-10"
	location = "nbg1"
}
