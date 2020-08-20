resource "aws_instance" "web" {
  ami           = "${data.aws_ami.centos.id}" 
  instance_type = "t2.micro"
  key_name  = "${aws_key_pair.class.key_name}" 
  vpc_security_group_ids = ["${aws_security_group.vpc_task.id}"]
  subnet_id = "${aws_subnet.public1.id}"
   associate_public_ip_address = true
}
