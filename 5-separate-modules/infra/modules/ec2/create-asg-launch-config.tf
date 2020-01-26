resource "aws_launch_configuration" "sv_launch_config" {
  name          = "sv-launch-config-${var.sv_cluster}"
  image_id      = var.linux_ami_id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.sv_key_pair.key_name
  #security_groups = [var.sv_elb_sg_id, var.sv_ec2_sg_id]
  security_groups = [var.sv_ec2_sg_id]
  associate_public_ip_address = true
  user_data     = data.template_file.ec2_user_data.rendered

  lifecycle {
    create_before_destroy = true
  }

}