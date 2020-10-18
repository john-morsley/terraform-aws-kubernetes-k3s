﻿#     __      __        _       _     _           
#     \ \    / /       (_)     | |   | |          
#      \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
#       \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
#        \  / (_| | |  | | (_| | |_) | |  __/\__ \
#         \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/

//variable "access_key" {
//  type = string
//}
//variable "secret_key" {
//  type = string
//}
//
//variable "region" {
//  type    = string
//  default = "eu-west-2" # London
//}

# Database...

variable "database_name" {
  type = string
}

variable "database_master_username" {
  type = string
}

variable "database_master_password" {
  type = string
}

variable "database_instance_type" {
  type = string
}