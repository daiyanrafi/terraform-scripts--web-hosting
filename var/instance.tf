resource "aws_instance" "dove-inst" {
    ami = var.AMIS[var.REGION]
    instance_type = "t2.micro"
    availability_zone = var.ZONE1
    key_name = "GG-MA-MAN"
    vpc_security_group_ids = ["sg-6556232949"]
    tags = {
        Name = "Dove-Instance"
        Project = "Dove"
    }
}