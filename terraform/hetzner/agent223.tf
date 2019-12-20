resource "hcloud_server" "aklimov-iliketrains1-agent223" {
	name = "aklimov-iliketrains1-agent223"

	server_type = "cx11"

	ssh_keys = [ "AK" ]
	image = "debian-10"
	location = "nbg1"
}
