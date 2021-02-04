# # create iam role 
# resource "aws_iam_role" "div_role" {
#   name = "div_role"

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF

#   tags = {
#     tag-key = "div-value-${var.additional_tags}"
#   }
# }
# # create  iam role policy
# resource "aws_iam_role_policy" "div_policy" {
#   name   = "div_policy"
#   role   = aws_iam_role.div_role.id
#   policy = <<-EOF
#   {
#     "Version": "2012-10-17",
#     "Statement": [
#       {
#         "Action": [
#           "ec2:Describe*"
#         ],
#         "Effect": "Allow",
#         "Resource": "*"
#       }
#     ]
#   }
#   EOF
# }
# # create Launch Template

# resource "aws_launch_template" "div_template" {
#   name            = "template"
#   image_id        = "ami-04b1ddd35fd71475a"
#   instance_type   = "t2.micro"
#   key_name        = "jani"
# }

# # create application load balancer
# resource "aws_lb" "div-ALB" {
#   name               = "ALB"
#   internal           = false
#   load_balancer_type = "application"
#   subnets            = aws_subnet.public.*.id
#   security_groups    = [aws_security_group.div-SG.id]
#   tags = {
#     Name = "div-alb-${var.additional_tags}"
#   }
# }

# # create autoscalling group

# resource "aws_autoscaling_group" "div-ASG" {
#   name                      = "Auto-div"
#   max_size                  = 2
#   min_size                  = 2
#   health_check_grace_period = 300
#   health_check_type         = "ELB"
#   desired_capacity          = 2
#   launch_template {
#     id      = aws_launch_template.div_template.id
#       version = aws_launch_template.div_template.latest_version
#   }
#   vpc_zone_identifier       = aws_subnet.public.*.id
#   tag {
#     key                 = "Name"
#     value               = "Asg"
#     propagate_at_launch = true
#   }
# }
