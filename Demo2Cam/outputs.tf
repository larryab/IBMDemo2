#####################################################################
##
##      Created 1/23/19 by admin. for Demo2Cam
##
#####################################################################

output "public_ip" {
  value = "${aws_instance.aws_instance_LA.public_ip}"
}

output " name" {
  value = "${random_pet.citi-pet.key_name}"
}

