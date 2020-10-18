module "simple-ec2" {

  source = "./../../../terraform-aws-kubernetes-k3s"
  //source = "john-morsley/ec2/aws"

  ec2_public_ip   = module.simple-k3s-ec2.public_ip
  ec2_encoded_private_key = module.simple-k3s-ec2.encoded_private_key

  depends_on = [
    module.simple-k3s-ec2
  ]

}