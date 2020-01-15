resource "aws_autoscaling_group" "sv_asg" {
  name                 = "sv-asg-grp"
  launch_configuration = aws_launch_configuration.sv_launch_config.id
  min_size             = 1
  max_size             = 1
  health_check_grace_period = 1200
  default_cooldown     = 400
  # vpc_zone_identifier  = [aws_subnet.sv_subnet_pub_a.id, aws_subnet.sv_subnet_pub_b.id, aws_subnet.sv_subnet_pub_c.id]
  vpc_zone_identifier  = [aws_subnet.sv_subnet_pub_a.id]
  health_check_type    = "ELB"
  min_elb_capacity     = 1

  tag {
    key                 = "Name"
    value               = "sv-asg-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "HSN"
    value               = "sv-asg-grp-instance"
    propagate_at_launch = true
  }

  timeouts {
    delete = "3m"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_attachment" "sv_asg_elb_attach" {
  autoscaling_group_name = aws_autoscaling_group.sv_asg.id
  elb                    = aws_elb.sv_elb.id
}