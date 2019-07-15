provider  "aws" {
   region="eu-north-1"
}

resource "aws_instance" "myvm"{
    ami = "ami-3f36be41"
    instance_type = "t3.micro"
}
