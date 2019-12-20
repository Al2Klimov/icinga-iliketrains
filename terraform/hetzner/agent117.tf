resource "hcloud_server" "aklimov-iliketrains1-agent117" {
	name = "aklimov-iliketrains1-agent117"

	server_type = "cx11"

	ssh_keys = [ "AK" ]
	image = "debian-10"
	location = "nbg1"
}
