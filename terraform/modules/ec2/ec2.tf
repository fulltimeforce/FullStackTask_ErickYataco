


resource "aws_security_group" "api_security_group" {
  name        = "${var.PROJECT}-ec2-sg-${var.ENVIROMENT}"
  description = "security group for back instance"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags =  {
    Name        = "${var.PROJECT}-ec2-sg-${var.ENVIROMENT}"
    Owner       = "${var.OWNER}"
    Enviroment  = "${var.ENVIROMENT}"
    Tool        = "Terraform"
  }
}
data "template_file" "init" {
  template = "${file("${path.module}/scripts/install.sh")}"
  vars = {    
    branch    = "${var.BRANCH}"
    user      = "${var.USER}"
    pass      = "${var.PASS}"
  }
}

resource "aws_key_pair" "mykeypair" {
  key_name   = "${var.PROJECT}-key-back-${var.ENVIROMENT}"
  public_key = "${file("${path.root}/${var.PATH_TO_PUBLIC_KEY}")}"
}

# TODO SG to open ports
resource "aws_instance" "api" {
  ami                   = "${var.AMIS[var.REGION]}"
  instance_type         = "${var.INSTANCE_TYPE}"
  key_name              = "${aws_key_pair.mykeypair.key_name}"  
  user_data             = "${data.template_file.init.rendered}"
  
  # TODO aws_volume_attachment
  # root_block_device {
  #   volume_type           = "gp2"
  #   volume_size           = 30
  #   delete_on_termination = false
  # }

  tags =  {
    Name        = "${var.PROJECT}-ec2-back-${var.ENVIROMENT}"
    Owner       = "${var.OWNER}"
    Enviroment  = "${var.ENVIROMENT}"
    Tool        = "Terraform"
  }
}


