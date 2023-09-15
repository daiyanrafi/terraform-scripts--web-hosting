resource "aws_key_pair" "dove-key" {
    key_name = "dovkey"
    public_key = file("dovkey.pub")
}

resource "aws_instance" "dove-inst" {
    ami = var.AMIS[var.REGION]
    instance_type = "t2.micro"
    availability_zone = var.ZONE1
    key_name = aws_key_pair.dov-key.key_name
    vpc_security_group_ids = ["sg-6556232949"]
    tags = {
        Name = "Dove-Instance"
        Project = "Dove"
    }

    provisioner "file" {
        source = "web.sh"
        destination = "/temp/web.sh"
    }

    provisioner "remote-exec" {

        inline = [
            "chmod u+x /temp/web.sh",
            "sudo /temp/web.sh"
        ]
    }

    connection {
        user = var.USER
        private_key = file("dovkey")
        host = self.public_ip
    }
}

output "PublicIP"{
    value = aws_instance.dove_inst.public_ip
}

output "PrivateIP"{
    value = aws_instance.dove_inst.private_ip
}