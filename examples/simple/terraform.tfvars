#     __      __        _       _     _           
#     \ \    / /       (_)     | |   | |          
#      \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
#       \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
#        \  / (_| | |  | | (_| | |_) | |  __/\__ \
#         \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/

name                = "simple-ks3-example"
vpc_cidr            = "10.0.0.0/16"   # 65,531 (65,536 possible - 5 reserved by AWS)
public_subnet_cidrs = ["10.0.1.0/24"] # 251 (256 possible - 5 reserved by AWS) 
//private_subnet_cidrs = ["10.0.2.0/24"] # 251 (256 possible - 5 reserved by AWS)

k3s_nodes = {
  node_one = {
    name          = "server-one"
    node_type     = "server"
    instance_type = "t2.medium"
    command       = "curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC=\"server --write-kubeconfig-mode 644\" sh -"
  }
}