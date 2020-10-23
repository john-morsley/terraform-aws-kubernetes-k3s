#      _                     _     
#     | |                   | |    
#     | |     ___   ___ __ _| |___ 
#     | |    / _ \ / __/ _` | / __|
#     | |___| (_) | (_| (_| | \__ \
#     |______\___/ \___\__,_|_|___/

locals {

  all_cidr_block = "0.0.0.0/0" # All possible IP address range
  
  //ec2_private_key = base64decode(var.ec2_encoded_private_key)
  
  shared_scripts_folder = "shared-scripts-${random_pet.shared-scripts.id}"
  
}