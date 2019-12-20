resource "hcloud_server" "aklimov-iliketrains1-master1" {
	name = "aklimov-iliketrains1-master1"

	server_type = "cx51"

	ssh_keys = [ "AK" ]
	image = "debian-10"
	location = "nbg1"
}
