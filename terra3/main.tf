provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias="us-bubba-1"
  region = "us-west-1"
}

resource "aws_instance" "eastvm"{
     ami = "ami-66506c1c"
     instance_type="t2.micro"
}

resource "aws_instance" "westvm"{
     provider="aws.us-bubba-1"
     ami = "ami-056ee704806822732"
     instance_type="t2.micro"
}