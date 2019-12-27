
resource "aws_instance" "sv_instance" {
  # ami           = "ami-0e9a26a04cf77de3b"
  ami           = data.aws_ami.linux_ami.id
  instance_type = "t2.micro"
  #depends_on = [aws_ami.linux_ami]
}
