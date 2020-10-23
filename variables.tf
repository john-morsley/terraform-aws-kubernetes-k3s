#     __      __        _       _     _           
#     \ \    / /       (_)     | |   | |          
#      \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
#       \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
#        \  / (_| | |  | | (_| | |_) | |  __/\__ \
#         \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/

variable "name" {
  type = string
  validation {
    condition = (
      length(var.name) > 0         
    )
    error_message = "The name must be a least 1 character in length."
  }
}

variable "vpc_id" {
  type = string
  validation {
    condition = (
      length(var.vpc_id) > 0 // &&
      // substr(var.name, 0, 4) == "ami-"      
    )
    error_message = "The vpc_id must be a least 1 character in length."
  }
}

variable "public_subnet_id" {
  type = string
  validation {
    condition = (
    length(var.public_subnet_id) > 0 // &&
    // substr(var.name, 0, 4) == "ami-"      
    )
    error_message = "The public_subnet_id must be a least 1 character in length."
  }
}

variable "availability_zone" {
  type = string
  validation {
    condition = (
      length(var.availability_zone) > 0 // &&
    // substr(var.name, 0, 4) == "ami-"      
    )
    error_message = "The availability_zone must be a least 1 character in length."
  }
}

variable "nodes" {
    type = map( object({
      name = string # The name of this node: Must be unique
      node_type = string # The type of this node: server or agent       
      instance_type = string # The type of this ec2 instance: i.e. t2.medium
    }))
//  validation {}
}

//variable "ec2_public_ip" {
//  type = string
//}
//
//variable "ec2_encoded_private_key" {
//  type = string
//}