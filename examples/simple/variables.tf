#     __      __        _       _     _           
#     \ \    / /       (_)     | |   | |          
#      \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
#       \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
#        \  / (_| | |  | | (_| | |_) | |  __/\__ \
#         \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/

variable "name" {
  type = string
}

//variable "instance_type" {
//  type    = string
//  default = "t2.medium"
//}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "k3s_nodes" {
  type = map(object({
    name          = string # The name of this node: Must be unique
    node_type     = string # The type of this node: server or agent
    instance_type = string # The type of this ec2 instance: i.e. t2.medium
  }))
}


//variable "private_subnet_cidrs" {
//  type = list(string)
//}