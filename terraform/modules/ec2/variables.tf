variable "PROJECT" {
  default = "fulltimeforce"
}

variable "ENVIROMENT" {
  default = "dev"
}

variable "OWNER" {
  default = "erick.yataco.s@gmail.com"
}

variable "REGION" {
  default = "us-east-1"
}

variable "PATH_TO_PUBLIC_KEY" {
  default=""
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e" //"ami-d874e0a0" 
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
    ca-central-1 = "ami-cb5ae7af"
  }
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "INSTANCES_NUMBER" {
  default = 1
}

variable "BRANCH" {
  default = 1
}

variable "USER" {
  default = 1
}

variable "PASS" {
  default = 1
}

