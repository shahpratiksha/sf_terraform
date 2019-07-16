module "frontend"{
    source="./aws_instances"
    tags={Name="coolinstance", environ="test", role="frontend"}
}

module "backend"{
    source="./aws_instances"
    tags={Name="coolinstance", environ="test", role="backend"}
    total_instances=2
    region="us-west-2"
    cmds=["sudo apt-get -y install sqlite3"]
}

output "frontend_ips"{
    value="${module.frontend.ips}"
}

output "backend_ips"{
    value="${module.backend.ips}"
}