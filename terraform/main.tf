module "instance-mongo-express" {
   source             = "./modules/ec2"
   PROJECT            = "Fulltimefroce"
   ENVIROMENT         = "dev"   
   PATH_TO_PUBLIC_KEY = "./ssh/monitor-dev.pub"
   INSTANCE_TYPE      = "t2.micro"
   REGION             = "${var.region}"
   BRANCH             = "${var.branch}"
   USER               = "${var.user}"
   PASS               = "${var.pass}"
}

