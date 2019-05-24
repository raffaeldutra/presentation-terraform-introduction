instance_type = "t2.micro"
region        = "us-east-1"
environment   = "production"
client_name   = "example-company"
account_name  = "example-company"
project_name  = "example-company-demonstration"

aws = {
    region  = "us-east-1"
    profile = "example-company"
}

vpc_cidr = "172.16.0.0/16"

az_public = [
    {
        name = "public"
        az   = "us-east-1a"
        cidr = "172.16.1.0/24"
    },
    {
        name = "public"
        az   = "us-east-1b"
        cidr = "172.16.3.0/24"
    }
]