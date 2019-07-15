provider "aws"{
    region = "us-east-1"
}
resource "aws_instance" "vm"{
    count=2
    availability_zone="${var.zones[count.index]}"
    ami = "ami-66506c1c"
    instance_type="t2.micro"
   
}

