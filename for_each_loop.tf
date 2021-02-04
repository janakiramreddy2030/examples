# variable "vpc_cidrs" {
#     type = set(string)
#     default =["10.0.0.0/16","10.1.0.0/16"]
  
# }
# resource "aws_vpc" "Myvpc1" {
#   for_each       = var.vpc_cidrs
#   cidr_block     = each.value
#   instance_tenancy = "default"

#   tags = {
#     Name = "each-value"
#   }
# }
