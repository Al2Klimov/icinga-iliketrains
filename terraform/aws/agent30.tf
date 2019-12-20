resource "aws_instance" "aklimov-iliketrains1-agent30" {
	tags = {
		Name = "aklimov-iliketrains1-agent30"
	}

	instance_type = "t2.nano"

	key_name = "AK"
	security_groups = [ "all-in" ]
	ami = "ami-01eb7b0c1119f2550"
}
