resource "aws_instance" "aklimov-iliketrains1-helper" {
	tags = {
		Name = "aklimov-iliketrains1-helper"
	}

	instance_type = "c5.4xlarge"

	key_name = "AK"
	security_groups = [ "all-in" ]
	ami = "ami-01eb7b0c1119f2550"
}
