resource "aws_launch_configuration" "sv_launch_config" {
  name          = "sv_launch_configuration"
  image_id      = var.linux_ami_id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.sv_key_pair.key_name
  security_groups = [aws_security_group.sv_elb_sg.id, aws_security_group.sv_ec2_sg.id]
  depends_on    = [aws_security_group.sv_elb_sg, aws_security_group.sv_ec2_sg]
  associate_public_ip_address = true
  user_data     = data.template_file.ec2_user_data.rendered

  lifecycle {
    create_before_destroy = true
  }

}