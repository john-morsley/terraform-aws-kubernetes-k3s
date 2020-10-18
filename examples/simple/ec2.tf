#      ______    _____   ___  
#     |  ____|  / ____| |__ \ 
#     | |__    | |         ) |
#     |  __|   | |        / / 
#     | |____  | |____   / /_ 
#     |______|  \_____| |____| 

module "simple-k3s-ec2" {

  source = "./../../../terraform-aws-ec2"
  //source = "john-morsley/ec2/aws"

  name = local.name

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  vpc_id = module.simple-vpc.id

  public_subnet_id = module.simple-vpc.public_subnet_ids[0]

  security_group_ids = [module.simple-k3s-ec2-sg.id]

  availability_zone = data.aws_availability_zones.available.names[0]

  bucket_name = local.bucket_name

  depends_on = [
    module.s3_bucket
  ]

}