data "template_file" "ec2_user_data" {
  template = file("${path.module}/ec2-user-data.tpl")

  # user_data = <<-EOT
    # alternate: script goes here
  # EOT
}
