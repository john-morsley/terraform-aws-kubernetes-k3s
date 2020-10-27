#      _  ______   _____ 
#     | |/ /___ \ / ____|
#     | ' /  __) | (___  
#     |  <  |__ < \___ \ 
#     | . \ ___) |____) |
#     |_|\_\____/|_____/ 

# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "install-k3s" {

  for_each = var.nodes
  
  depends_on = [
    null_resource.get-shared-scripts
  ]

  // provisioner "local-exec" {
  //   command = "bash ${path.module}/scripts/install_k3s.sh"
  //   environment = {
  //     TEST = "Hello"
  //   }
  // }

  connection {
    type        = "ssh"
    host        = module.k3s-ec2[each.key].public_ip
    user        = "ubuntu"
    private_key = base64decode(module.k3s-ec2[each.key].encoded_private_key)
  }

  # https://www.terraform.io/docs/provisioners/file.html

  provisioner "file" {
    source      = "${path.module}/scripts/install_k3s.sh"
    destination = "install_k3s.sh"
  }

  # https://www.terraform.io/docs/provisioners/remote-exec.html

  provisioner "remote-exec" {
    inline = ["chmod +x install_k3s.sh && bash install_k3s.sh '${each.value.command}'"]
  }

}

# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "get-kube-config" {

 depends_on = [
   null_resource.install-k3s
 ]

 connection {
   type        = "ssh"
   host        = var.ec2_public_ip
   user        = "ubuntu"
   private_key = local.ec2_private_key
 }
 
 # https://www.terraform.io/docs/provisioners/remote-exec.html

 provisioner "remote-exec" {
   inline = ["scp -i ./keys/${}.pem ubuntu@${var.ec2_public_ip}:/etc/rancher/k3s/ks3.yaml k3s.yaml"]
 }

}