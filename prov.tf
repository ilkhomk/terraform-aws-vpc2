resource "null_resource"  "commands" {
    depends_on = ["aws_instance.web"]
    triggers = {
        always_run = "${timestamp()}"
    }
    provisioner "remote-exec" {
        connection {
        host = "${aws_instance.web.public_ip}"
        type = "ssh"
        user = "centos"
        private_key = "${file("~/.ssh/id_rsa")}"
    }
    inline = [
        "sudo yum install httpd -y",
        "sudo systemctl start httpd",
        "sudo systemctl enable httpd",
        ]
    }
}