# # create region
# provider "aws" {
#   region = var.region

# }

# create vpc
resource "aws_vpc" "Myvpc" {
  cidr_block = var.cidr
      tags = {
        "Name" = "Myvpc"
      }
}
     
# # # create subnet
# # resource "aws_subnet" "Mysubnet" {
# #   vpc_id     = aws_vpc.Myvpc.id
# #   cidr_block = var.subnet_cidr
# #   tags = {
# #     "Name" = "Mysubnet-${var.additional_tags}"
# #   }
# # }

# # create public subnet
# resource "aws_subnet" "public" {
#   count             = local.azs
#   vpc_id            = aws_vpc.Myvpc.id
#   availability_zone = local.azs_names[count.index]
#   cidr_block        = cidrsubnet(var.cidr, 8, count.index) 
#   tags = {
#     Name       = "public-${count.index}-${var.additional_tags}"
#     Department = "Finance"
#   }
# }


# # # Create Internet gateway
# # resource "aws_internet_gateway" "GW" {
# #   vpc_id = aws_vpc.Myvpc.id

# #   tags = {
# #     Name = "Internet-GW-${var.additional_tags}"
# #   }
# # }

# # # create route table
# # resource "aws_route_table" "route" {
# #   vpc_id = aws_vpc.Myvpc.id

# #   route {
# #     cidr_block = var.route_table
# #     gateway_id = aws_internet_gateway.GW.id
# #     }

# #     tags = {
# #     Name = "route-${var.additional_tags}"
# #   }
# # }
# #   # create public subnet associate
# #   resource "aws_route_table_association" "route-a" {
# #   count = local.azs
# #   subnet_id      = aws_subnet.public.*.id[count.index]
# #   route_table_id = aws_route_table.route.id
# # }

# # # create private subnet
# # resource "aws_subnet" "private" {
# #   count             = local.azs
# #   vpc_id            = aws_vpc.Myvpc.id
# #   cidr_block        = cidrsubnet(var.cidr, 8,local.azs+count.index) 
# #   tags = {
# #     Name       = "private-${count.index}-${var.additional_tags}"
# #     Department = "Finance"
# #   }
# # }
# # # create eip
# # resource "aws_eip" "E" {
# #   vpc = true
# # }
# # # Nat gateway
# # resource "aws_nat_gateway" "NG" {
# #   allocation_id = aws_eip.E.id
# #   subnet_id     = aws_subnet.public.*.id[0]

# #   tags = {
# #     Name = "gw NAT-${var.additional_tags}"
# #   }
# # }

# # # create private subnet associate
# # resource "aws_route_table_association" "route-b" {
# #   count = local.azs 
# #   subnet_id      = aws_subnet.private.*.id[count.index]
# #   route_table_id = aws_route_table.route.id
# # }