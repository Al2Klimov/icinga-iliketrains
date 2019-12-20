resource "hcloud_server" "aklimov-iliketrains1-agent94" {
	name = "aklimov-iliketrains1-agent94"

	server_type = "cx11"

	ssh_keys = [ "AK" ]
	image = "debian-10"
	location = "nbg1"
}
