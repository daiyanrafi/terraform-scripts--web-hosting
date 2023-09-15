provider "aws" {
    region = "us-east-2"
    access_key = ""
    secrect_key = ""
}

resources "aws_instance" "firstEx" {
    ami = "ami-wsdhnsnddnsk"
    instance_type = "t2.micro"
    availability_zone = "us-east-2a"
    key_name = "GG-MA-MAN"
    vpc_security_group_ids = ["sg-6556232949"]
    tags = {
        Name = "Dove-Instance"
        Project = "Dove"
    }
}