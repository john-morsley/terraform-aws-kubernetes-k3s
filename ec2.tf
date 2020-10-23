#      ______    _____   ___  
#     |  ____|  / ____| |__ \ 
#     | |__    | |         ) |
#     |  __|   | |        / / 
#     | |____  | |____   / /_ 
#     |______|  \_____| |____| 

module "k3s-ec2" {

  source = "./../terraform-aws-ec2"
  //source = "john-morsley/ec2/aws"

  for_each = var.nodes
  
  name          = "${var.name}-${each.value.name}"
  ami           = data.aws_ami.ubuntu.id
  instance_type = each.value.instance_type

  vpc_id = var.vpc_id
  public_subnet_id = var.public_subnet_id
  availability_zone = var.availability_zone

}