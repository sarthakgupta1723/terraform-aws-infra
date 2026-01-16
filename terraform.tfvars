aws_region = "us-east-1"

vpc_cidr = "10.0.0.0/16"

public_subnets = {
  az1 = { cidr = "10.0.1.0/24", az = "us-east-1a" }
  az2 = { cidr = "10.0.2.0/24", az = "us-east-1b" }
}

private_subnets = {
  az1 = { cidr = "10.0.11.0/24", az = "us-east-1a" }
  az2 = { cidr = "10.0.12.0/24", az = "us-east-1b" }
}

ami_id        = "ami-0abcdef1234567890"
instance_type = "t3.micro"
key_name      = "my-key"

data_disks = [
  { size = 20, type = "gp3" },
  { size = 50, type = "gp3" }
]

tags = {
  Environment = "dev"
  Project     = "terraform-learning"
  Owner       = "Sarthak"
}
