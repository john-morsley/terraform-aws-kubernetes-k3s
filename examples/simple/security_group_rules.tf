#       _____                      _ _         
#      / ____|                    (_) |        
#     | (___   ___  ___ _   _ _ __ _| |_ _   _ 
#      \___ \ / _ \/ __| | | | '__| | __| | | |
#      ____) |  __/ (__| |_| | |  | | |_| |_| |
#     |_____/ \___|\___|\__,_|_|  |_|\__|\__, |
#            _____                        __/ |
#           / ____|                      |___/ 
#          | |  __ _ __ ___  _   _ _ __  
#          | | |_ | '__/ _ \| | | | '_ \ 
#          | |__| | | | (_) | |_| | |_) |
#           \_____|_|  \___/ \__,_| .__/ 
#                _____       _    | |  
#               |  __ \     | |   |_|  
#               | |__) |   _| | ___ 
#               |  _  / | | | |/ _ \
#               | | \ \ |_| | |  __/
#               |_|  \_\__,_|_|\___|

module "simple-security-group-rule-ingress" {

  source = "./../../../terraform-aws-security-group-rule"
  #source = "john-morsley/security-group-rule/aws"

  description = "Ingress for SSH."

  security_group_id = module.simple-k3s-ec2-sg.id

  type      = "ingress"
  from_port = 22
  to_port   = 22
  protocol  = "tcp"
  cidrs     = ["0.0.0.0/0"]

}

module "simple-security-group-rule-egress" {

  source = "./../../../terraform-aws-security-group-rule"
  #source = "john-morsley/security-group-rule/aws"

  description = "Egress for SSH."

  security_group_id = module.simple-k3s-ec2-sg.id

  type      = "egress"
  from_port = 0
  to_port   = 0
  protocol  = "-1"
  cidrs     = ["0.0.0.0/0"]

}