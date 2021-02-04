
variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.0.0/16"
}

# variable "subnet_cidr" {
#   default = "10.0.0.0/24"

# }

variable "additional_tags" {
  description = "Additional resource tags"
  default =""
  type        = string
}

variable "region" {
  description = "AWS Deployment region.."
  default = "ap-south-1"
}

# variable "route_table"{
#   default = "0.0.0.0/0"
# }

