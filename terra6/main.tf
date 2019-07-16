terraform {
    backend "s3"{
        bucket="jkterra"
        key="bubba/terraform.tfstate"
        region="us-east-1"
    }
    
}

provider  "aws" {
   region="us-east-1"
}

locals {
    vm_name="${join("-",list(terraform.workspace,"vm"))}"
}


resource "aws_instance" "myvm"{

    tags = {
        Name = "${local.vm_name}"
    }
    ami = "ami-66506c1c"
    instance_type = "t2.micro"
}
