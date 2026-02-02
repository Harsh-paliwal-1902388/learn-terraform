resource "aws_instance" "example" {
  ami   = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  count = 2
  # instance_type = "t3.micro"

  # conditional (if/else ki trah h)
  instance_type = var.Environment == "prod" ? "t2.micro" : "t3.micro"

  tags = var.tags
}


# resource "aws_security_group" "ingress_rule" {
#   name   = "sg"

#   ingress {
#     from_port = 80
#     to_port = 80
#     protocol = "http"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }
#   egress  = []
# }

# Dynamic block:
resource "aws_security_group" "ingress_rule" {
  name = "sg"
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }
}


locals {
  all_instance_id = aws_instance.example[*].id
}

output "instances" {
  value = local.all_instance_id
}