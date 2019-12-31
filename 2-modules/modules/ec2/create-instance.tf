
resource "aws_instance" "sv_instance" {
  ami           = var.linux_ami_id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.sv_key_pair.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_me_sg.id}"]
  depends_on = [aws_security_group.allow_me_sg]
  subnet_id = aws_subnet.sv_subnet_pub_a.id
  associate_public_ip_address = true
  tags = {
    Name = "sv-instance"
    HSN = "sv-ec2-instance" 
  }
}

resource "aws_key_pair" "sv_key_pair" {
 key_name   = "sv-ec2-ssh"
 public_key = file("${var.pub_key_path}")
}

