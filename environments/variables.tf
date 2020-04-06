variable "key_name" {

  type = "string"
}

variable "subnet_id" {

  type = "string"
}

variable "vpc_security_group" {
    
  type = "string"
}

variable "tag" {
    
  type = "string"
}

variable "associate_public_ip_address" {

  description = "If true, the EC2 instance will have associated public IP address"
  
  default     = true
}

variable "ami" {
    
  type = "string"

  default = "ami-07eda9385feb1e969"
}