#####################################################################
##
##      Created 1/23/19 by admin. for Demo2Cam
##
#####################################################################

output "public_ip" {
  value = "${aws_instance.aws_instance_LA.public_ip}"
}

output "key_name" {
  value = "${aws_instance.aws_instance_LA.key_name}"
}



