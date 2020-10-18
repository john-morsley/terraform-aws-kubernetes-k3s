#      _  ______   _____ 
#     | |/ /___ \ / ____|
#     | ' /  __) | (___  
#     |  <  |__ < \___ \ 
#     | . \ ___) |____) |
#     |_|\_\____/|_____/ 

# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "install-k3s" {

  #count = var.docker ? 1 : 0

  depends_on = [
    null_resource.get-shared-scripts#,
    #aws_instance.this
  ]

  connection {
    type        = "ssh"
    host        = var.ec2_public_ip
    user        = "ubuntu"
    private_key = var.ec2_private_key
  }

  # https://www.terraform.io/docs/provisioners/file.html

  provisioner "file" {
    source      = "${path.cwd}/${local.shared_scripts_folder}/k3s/install_k3s.sh"
    destination = "install_k3s.sh"
  }

  # https://www.terraform.io/docs/provisioners/remote-exec.html

  provisioner "remote-exec" {
    inline = ["chmod +x install_k3s.sh && bash install_k3s.sh"]
  }

}