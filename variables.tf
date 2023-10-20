################## D E C L A R E - V A R I A B L E ####################

################################### A W S #################################

variable "access_key" {}
variable "secret_key" {}
variable "region" {}

################################### V P C #################################

variable "aws_vpc_1_name" {}
variable "cidr_block" {}

################################### S U B N E T # 1 #################################

variable "availability_zone_1" {}
variable "aws_subnet_1_name" {}
variable "subnet_1_cidr_block" {}


################################### S U B N E T # 2 #################################

variable "availability_zone_2" {}
variable "aws_subnet_2_name" {}
variable "subnet_2_cidr_block" {}

###################### I N T E R N E T - G A T E W A Y #################################

variable "aws_igw_1_name" {}

###################### R O U T E - T A B L E #################################

variable "aws_rt_1_name" {} 

################################### I N S T A N C E # 1 #################################

variable "ami" {}
variable "instance_type_1" {}
variable "instance_1_installs" {}
variable "key_pair" {}
variable "aws_instance_1_name" {}

################################### I N S T A N C E # 2 #################################
  
variable "instance_type_2" {}
variable "instance_2_installs" {}
variable "aws_instance_2_name" {}

####################### S E C U R I T Y - G R O U P # 1 ##############################

variable "aws_sg_1_name" {}
variable "sg_1_description" {}


####################### S E C U R I T Y - G R O U P # 2 ##############################

variable "aws_sg_2_name" {}
variable "sg_2_description" {}

#Set IAM role for instances
variable "access_level"             {default = "ec2_full_access_role"}
variable "ver"                      {default = "2012-10-17"}
variable "action"                   {default = "sts:AssumeRole"}
variable "effect"                   {default = "Allow"}
variable "principal_service"        {default = "ec2.amazonaws.com"}
variable "policy_arn"               {default = "arn:aws:iam::aws:policy/AdministratorAccess"}
variable "instance_profile_name"    {default = "ec2_full_access_profile"}
variable "machine_role"             {default = "dp5_machine_role"}

#Set variables for instance tags
variable "ec2_instance_tag_1" {
  description = "tag for first instance"
  type        = map(string)
}

variable "ec2_instance_tag_2" {
  description = "tag for second instance"
  type        = map(string)
}

variable "ec2_instance_tag_3" {
  description = "tag for third instance"
  type        = map(string)
}

#Set variable for user data scripts
variable "ud_jenkins" {
  description = "path to jenkins with python script"
  default     = "user_data_5.1_jenkins.sh"
}

variable "ud_py_java" {
  description = "path to python script"
  default     = "user_data_5.1_java_python.sh"
}

#Set variables for ingress (incoming) traffic
variable "ssh_access" {
  description = "access through SSH on PORT 22"
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
  default = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "http_access" {
  description = "access through http on PORT 8000"
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
  default = {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "jenkins_access" {
  description = "access jenkins on PORT 8080"
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
  default = {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#Set variables for egress(outgoing) traffic
variable "anywhere_outgoing" {
  description = "go anywhere outbound with any protocol"
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
  default = {
    from_port   = 0
    to_port     = 65000
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

