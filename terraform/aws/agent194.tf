resource "aws_instance" "aklimov-iliketrains1-agent194" {
	tags = {
		Name = "aklimov-iliketrains1-agent194"
	}

	instance_type = "t2.nano"

	key_name = "AK"
	security_groups = [ "all-in" ]
	ami = "ami-01eb7b0c1119f2550"
}
