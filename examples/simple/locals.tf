#      _                     _
#     | |                   | |    
#     | |     ___   ___ __ _| |___ 
#     | |    / _ \ / __/ _` | / __|
#     | |___| (_) | (_| (_| | \__ \
#     |______\___/ \___\__,_|_|___/

locals {

  all_cidr_block = "0.0.0.0/0"

  bucket_name = "${var.name}-${random_pet.bucket.id}"

  name = "${var.name}-${random_pet.name.id}"

}