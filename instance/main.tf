
# AWS Provider Configuration
provider "aws" {
  region = "us-east-2"
}

# Allow permission on the SG
resource "aws_security_group" "allow_rules" {
  name = var.sg_name
  #description = "Allow SSH Traffic"
  #vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  tags = {
    Name = "Allow Rules"
  }
}

resource "aws_instance" "web" {
  #ami           = "ami-0aca3c257a389fcf3"
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = ["${aws_security_group.allow_rules.name}"]
  tags            = var.tags
}
