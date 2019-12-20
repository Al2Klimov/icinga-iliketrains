resource "hcloud_server" "aklimov-iliketrains1-agent249" {
	name = "aklimov-iliketrains1-agent249"

	server_type = "cx11"

	ssh_keys = [ "AK" ]
	image = "debian-10"
	location = "nbg1"
}
