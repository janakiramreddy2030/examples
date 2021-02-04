# resource "aws_instance" "demo" {
#     instance_type = "t2.micro"
#     ami = "ami-08e0ca9924195beba"
#     subnet_id = aws_subnet.public.*.id[0]
#     key_name = "jani"
#     security_groups = aws_security_group.div-SG.id
    
# provisioner "file" {
#     source      = "apache.sh"
#     destination = "~/apache123.sh"
#   }
   
# connection {
#     type     = "ssh"
#     user     = "ec2-user"
#     private_key = file("C:/Users/Dell/Downloads/jani.pem")
#     host     = self.public_ip
#   }
# }

