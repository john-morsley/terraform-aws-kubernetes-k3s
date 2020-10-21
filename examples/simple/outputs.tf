#       ____        _               _       
#      / __ \      | |             | |      
#     | |  | |_   _| |_ _ __  _   _| |_ ___
#     | |  | | | | | __| '_ \| | | | __/ __|
#     | |__| | |_| | |_| |_) | |_| | |_\__ \
#      \____/ \__,_|\__| .__/ \__,_|\__|___/
#                      | |                  
#                      |_|

output "name" {
  value = local.name
}

output "ec2_name" {
  value = module.simple-k3s-ec2.name
}

output "ec2_ssh_command" {
  value = module.simple-k3s-ec2.ssh_command
}