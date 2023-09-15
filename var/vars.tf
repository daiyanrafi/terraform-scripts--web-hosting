variable REGION {
    default = "us-east-2"
}

variable ZONE1 {
    default = "us-east-2a"
}

variable AMIS {
    type = map
    default = {
        us-east-2 = "ami-wsdhnsnddnsk"
        us-east-1 = "ami-86dfnsnddnsk"
    }
}