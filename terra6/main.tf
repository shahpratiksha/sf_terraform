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
    count=2
    ami = "ami-66506c1c"
    instance_type = "t2.micro"
    key_name="bubba"
    security_groups = ["default"]
    provisioner "remote-exec"{
      inline=["touch test.dat"]
      connection{
          host = "${self.public_ip}"
          type  = "ssh"
          user = "ubuntu"
          private_key = "${file("/home/ec2-user/environment/bubba")}"
      }
        
    }
}
