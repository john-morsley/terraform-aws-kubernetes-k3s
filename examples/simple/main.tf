module "simple-k3s" {

  source = "./../../../terraform-aws-kubernetes-k3s"
  //source = "john-morsley/ec2/aws"

  //ec2_public_ip           = module.simple-k3s-ec2.public_ip
  //ec2_encoded_private_key = module.simple-k3s-ec2.encoded_private_key

  name = local.name

  vpc_id            = module.simple-k3s-vpc.id
  public_subnet_id  = module.simple-k3s-vpc.public_subnet_ids[0]
  availability_zone = data.aws_availability_zones.available.names[0]

  nodes = var.k3s_nodes

  depends_on = [
    //module.simple-k3s-ec2
  ]

}